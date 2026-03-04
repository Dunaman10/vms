<?php

namespace App\Filament\Exports;

use App\Enums\BookingStatus;
use App\Models\Booking;
use Filament\Actions\Exports\ExportColumn;
use Filament\Actions\Exports\Exporter;
use Filament\Actions\Exports\Models\Export;
use Illuminate\Support\Number;

class BookingExporter extends Exporter
{
  protected static ?string $model = Booking::class;

  public static function getColumns(): array
  {
    return [
      ExportColumn::make('vehicle.vehicle_name')
        ->label('Kendaraan'),
      ExportColumn::make('driver.driver_name')
        ->label('Pengemudi'),
      ExportColumn::make('purpose')
        ->label('Keperluan'),
      ExportColumn::make('status')
        ->label('Status')
        ->formatStateUsing(fn($state) => match ($state) {
          BookingStatus::Pending, 'pending' => 'Menunggu',
          BookingStatus::ApprovedL1, 'approved_l1' => 'Disetujui L1',
          BookingStatus::ApprovedL2, 'approved_l2' => 'Disetujui L2',
          BookingStatus::Rejected, 'rejected' => 'Ditolak',
          BookingStatus::Completed, 'completed' => 'Selesai',
          default => (string) $state,
        }),
    ];
  }

  public static function getCompletedNotificationBody(Export $export): string
  {
    $body = 'Export pemesanan kendaraan selesai, ' . Number::format($export->successful_rows) . ' baris berhasil diexport.';

    if ($failedRowsCount = $export->getFailedRowsCount()) {
      $body .= ' ' . Number::format($failedRowsCount) . ' baris gagal diexport.';
    }

    return $body;
  }
}
