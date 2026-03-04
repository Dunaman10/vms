<?php

namespace App\Filament\Approver\Resources\Bookings;

use App\Enums\UserRole;
use App\Filament\Approver\Resources\Bookings\Pages\ListBookings;
use App\Filament\Resources\Bookings\Schemas\BookingForm;
use App\Filament\Resources\Bookings\Tables\BookingsTable;
use App\Models\Booking;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class BookingResource extends Resource
{
  protected static ?string $model = Booking::class;

  protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedTruck;
  protected static ?string $navigationLabel = 'Persetujuan Kendaraan';
  protected static ?string $label = 'Persutujuan Kendaraan';
  protected static ?string $pluralLabel = 'Persetujuan Kendaraan';

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
    ];
  }

  public static function getEloquentQuery(): Builder
  {
    $query = parent::getEloquentQuery();
    $user = auth()->user();

    if ($user->role === UserRole::Approver) {
      $query->where(function ($q) use ($user) {
        $q->where('approved_l1_id', $user->id)
          ->orWhere('approved_l2_id', $user->id);
      });
    }

    return $query;
  }

  public static function canCreate(): bool
  {
    return false;
  }

  public static function canEdit(Model $record): bool
  {
    return false;
  }

  public static function canDelete(Model $record): bool
  {
    return false;
  }
}
