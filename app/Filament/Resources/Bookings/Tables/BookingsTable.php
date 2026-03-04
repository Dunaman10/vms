<?php

namespace App\Filament\Resources\Bookings\Tables;

use App\Enums\ApprovalStatus;
use App\Enums\BookingStatus;
use App\Enums\UserRole;
use App\Models\Booking;
use Filament\Actions\Action;
use Filament\Actions\ActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Forms\Components\Textarea;
use Filament\Notifications\Notification;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;

class BookingsTable
{
  public static function configure(Table $table): Table
  {
    return $table
      ->columns([
        TextColumn::make('admin.username')
          ->label('Dibuat Oleh')
          ->alignCenter()
          ->searchable(),
        TextColumn::make('vehicle.vehicle_name')
          ->label('Kendaraan')
          ->description(fn($record) => $record->vehicle?->licenses_plate)
          ->searchable(),
        TextColumn::make('driver.driver_name')
          ->label('Pengemudi')
          ->searchable(),
        TextColumn::make('start_date')
          ->label('Mulai')
          ->date('d M Y')
          ->alignCenter()
          ->sortable(),
        TextColumn::make('end_date')
          ->label('Selesai')
          ->date('d M Y')
          ->alignCenter()
          ->sortable(),
        TextColumn::make('purpose')
          ->label('Keperluan')
          ->limit(30),
        TextColumn::make('status')
          ->label('Status')
          ->badge()
          ->formatStateUsing(fn(BookingStatus $state) => match ($state) {
            BookingStatus::Pending => 'Menunggu',
            BookingStatus::ApprovedL1 => 'Disetujui L1',
            BookingStatus::ApprovedL2 => 'Disetujui L2',
            BookingStatus::Rejected => 'Ditolak',
            BookingStatus::Completed => 'Selesai',
          })
          ->color(fn(BookingStatus $state) => match ($state) {
            BookingStatus::Pending => 'warning',
            BookingStatus::ApprovedL1 => 'info',
            BookingStatus::ApprovedL2 => 'success',
            BookingStatus::Rejected => 'danger',
            BookingStatus::Completed => 'gray',
          })
          ->alignCenter(),
      ])
      ->defaultSort('created_at', 'desc')
      ->filters([
        SelectFilter::make('status')
          ->label('Status')
          ->options([
            BookingStatus::Pending->value => 'Menunggu',
            BookingStatus::ApprovedL1->value => 'Disetujui L1',
            BookingStatus::ApprovedL2->value => 'Disetujui L2',
            BookingStatus::Rejected->value => 'Ditolak',
            BookingStatus::Completed->value => 'Selesai',
          ]),
        \Filament\Tables\Filters\Filter::make('created_at')
          ->form([
            \Filament\Forms\Components\DatePicker::make('created_from')
              ->label('Dari Tanggal'),
            \Filament\Forms\Components\DatePicker::make('created_until')
              ->label('Sampai Tanggal'),
          ])
          ->query(function (\Illuminate\Database\Eloquent\Builder $query, array $data): \Illuminate\Database\Eloquent\Builder {
            return $query
              ->when(
                $data['created_from'],
                fn(\Illuminate\Database\Eloquent\Builder $query, $date): \Illuminate\Database\Eloquent\Builder => $query->whereDate('created_at', '>=', $date),
              )
              ->when(
                $data['created_until'],
                fn(\Illuminate\Database\Eloquent\Builder $query, $date): \Illuminate\Database\Eloquent\Builder => $query->whereDate('created_at', '<=', $date),
              );
          })
          ->indicateUsing(function (array $data): array {
            $indicators = [];
            if ($data['created_from'] ?? null) {
              $indicators[] = \Filament\Tables\Filters\Indicator::make('Dibuat dari ' . \Carbon\Carbon::parse($data['created_from'])->toFormattedDateString())
                ->removeField('created_from');
            }
            if ($data['created_until'] ?? null) {
              $indicators[] = \Filament\Tables\Filters\Indicator::make('Dibuat sampai ' . \Carbon\Carbon::parse($data['created_until'])->toFormattedDateString())
                ->removeField('created_until');
            }
            return $indicators;
          }),
      ])
      ->recordActions([
        ActionGroup::make([
          ViewAction::make(),
          EditAction::make()
            ->visible(fn(Booking $record) => auth()->user()->role === UserRole::Admin
              && $record->status === BookingStatus::Pending),
          DeleteAction::make()
            ->visible(fn(Booking $record) => auth()->user()->role === UserRole::Admin
              && $record->status === BookingStatus::Pending),
          Action::make('approve')
            ->label('Setujui')
            ->icon('heroicon-o-check-circle')
            ->color('success')
            ->requiresConfirmation()
            ->modalHeading('Setujui Pemesanan')
            ->modalDescription('Apakah Anda yakin ingin menyetujui pemesanan ini?')
            ->form([
              Textarea::make('notes')
                ->label('Catatan (Opsional)')
                ->rows(2),
            ])
            ->action(function (Booking $record, array $data) {
              $user = auth()->user();
              $level = self::getApproverLevel($record, $user->id);

              $record->bookingApprovals()->create([
                'approver_id' => $user->id,
                'level' => $level,
                'status' => ApprovalStatus::Approved->value,
                'notes' => $data['notes'] ?? null,
              ]);

              $newStatus = $level === 1
                ? BookingStatus::ApprovedL1
                : BookingStatus::ApprovedL2;

              $record->update(['status' => $newStatus->value]);

              Notification::make()
                ->title('Pemesanan disetujui')
                ->success()
                ->send();
            })
            ->visible(fn(Booking $record) => self::canApprove($record)),
          Action::make('reject')
            ->label('Tolak')
            ->icon('heroicon-o-x-circle')
            ->color('danger')
            ->requiresConfirmation()
            ->modalHeading('Tolak Pemesanan')
            ->modalDescription('Apakah Anda yakin ingin menolak pemesanan ini?')
            ->form([
              Textarea::make('notes')
                ->label('Alasan Penolakan')
                ->rows(2)
                ->required(),
            ])
            ->action(function (Booking $record, array $data) {
              $user = auth()->user();
              $level = self::getApproverLevel($record, $user->id);

              $record->bookingApprovals()->create([
                'approver_id' => $user->id,
                'level' => $level,
                'status' => ApprovalStatus::Rejected->value,
                'notes' => $data['notes'],
              ]);

              $record->update(['status' => BookingStatus::Rejected->value]);

              Notification::make()
                ->title('Pemesanan ditolak')
                ->danger()
                ->send();
            })
            ->visible(fn(Booking $record) => self::canApprove($record)),
        ]),
      ]);
  }

  /**
   * Determine if the current user can approve this booking.
   */
  private static function canApprove(Booking $record): bool
  {
    $user = auth()->user();

    if ($user->role !== UserRole::Approver) {
      return false;
    }

    // L1 approver can approve when status is pending
    if ($record->approved_l1_id === $user->id && $record->status === BookingStatus::Pending) {
      return true;
    }

    // L2 approver can approve when status is approved_l1
    if ($record->approved_l2_id === $user->id && $record->status === BookingStatus::ApprovedL1) {
      return true;
    }

    return false;
  }

  /**
   * Get the approval level for the current approver.
   */
  private static function getApproverLevel(Booking $record, int $userId): int
  {
    if ($record->approved_l1_id === $userId) {
      return 1;
    }

    return 2;
  }
}
