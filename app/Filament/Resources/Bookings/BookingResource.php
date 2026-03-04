<?php

namespace App\Filament\Resources\Bookings;

use App\Filament\Resources\Bookings\Pages\CreateBooking;
use App\Filament\Resources\Bookings\Pages\EditBooking;
use App\Filament\Resources\Bookings\Pages\ListBookings;
use App\Filament\Resources\Bookings\Schemas\BookingForm;
use App\Filament\Resources\Bookings\Tables\BookingsTable;
use App\Models\Booking;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;
use Illuminate\Contracts\Support\Htmlable;
use UnitEnum;

class BookingResource extends Resource
{
  protected static ?string $model = Booking::class;

  protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedCalendar;
  protected static string | UnitEnum | null $navigationGroup = 'Operational';
  protected static ?int $navigationSort = 2;
  protected static ?string $navigationLabel = 'Pesan Kendaraan';
  protected static ?string $label = 'Pesan Kendaraan';
  protected static ?string $pluralLabel = 'Pesan Kendaraan';

  public static function form(Schema $schema): Schema
  {
    return BookingForm::configure($schema);
  }

  public static function table(Table $table): Table
  {
    return BookingsTable::configure($table);
  }

  public static function getRelations(): array
  {
    return [
      //
    ];
  }

  public static function getPages(): array
  {
    return [
      'index' => ListBookings::route('/'),
      'create' => CreateBooking::route('/create'),
      'edit' => EditBooking::route('/{record}/edit'),
    ];
  }

  public static function getEloquentQuery(): \Illuminate\Database\Eloquent\Builder
  {
    $query = parent::getEloquentQuery();
    $user = auth()->user();

    if ($user->role === \App\Enums\UserRole::Approver) {
      $query->where(function ($q) use ($user) {
        $q->where('approved_l1_id', $user->id)
          ->orWhere('approved_l2_id', $user->id);
      });
    }

    return $query;
  }

  public static function canCreate(): bool
  {
    return auth()->user()->role === \App\Enums\UserRole::Admin;
  }

  public static function canEdit(\Illuminate\Database\Eloquent\Model $record): bool
  {
    return auth()->user()->role === \App\Enums\UserRole::Admin && $record->status === \App\Enums\BookingStatus::Pending;
  }

  public static function canDelete(\Illuminate\Database\Eloquent\Model $record): bool
  {
    return auth()->user()->role === \App\Enums\UserRole::Admin && $record->status === \App\Enums\BookingStatus::Pending;
  }
}
