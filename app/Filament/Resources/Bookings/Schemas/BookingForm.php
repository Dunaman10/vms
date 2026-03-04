<?php

namespace App\Filament\Resources\Bookings\Schemas;

use App\Enums\BookingStatus;
use App\Models\Booking;
use App\Models\Driver;
use App\Models\User;
use App\Models\Vehicle;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Schemas\Components\Utilities\Get;
use Filament\Schemas\Schema;

class BookingForm
{
  public static function configure(Schema $schema): Schema
  {
    return $schema
      ->columns(2)
      ->components([
        DatePicker::make('start_date')
          ->label('Tanggal Mulai')
          ->required()
          ->live(),
        DatePicker::make('end_date')
          ->label('Tanggal Selesai')
          ->after('start_date')
          ->required()
          ->live(),
        Select::make('vehicle_id')
          ->label('Kendaraan')
          ->options(function (Get $get, ?Booking $record) {
            $startDate = $get('start_date');
            $endDate = $get('end_date');

            $query = Vehicle::query();

            if ($startDate && $endDate) {
              $busyVehicleIds = Booking::query()
                ->where('status', '!=', BookingStatus::Rejected->value)
                ->where('start_date', '<', $endDate)
                ->where('end_date', '>', $startDate)
                ->when($record, fn($q) => $q->where('id', '!=', $record->id))
                ->pluck('vehicle_id');

              $query->whereNotIn('id', $busyVehicleIds);
            }

            return $query->get()
              ->mapWithKeys(fn(Vehicle $vehicle) => [
                $vehicle->id => "{$vehicle->vehicle_name} ({$vehicle->licenses_plate})",
              ]);
          })
          ->searchable()
          ->required()
          ->helperText(function (Get $get) {
            if (! $get('start_date') || ! $get('end_date')) {
              return 'Pilih tanggal mulai & selesai terlebih dahulu';
            }

            return null;
          }),
        Select::make('driver_id')
          ->label('Pengemudi')
          ->options(function (Get $get, ?Booking $record) {
            $startDate = $get('start_date');
            $endDate = $get('end_date');

            $query = Driver::query();

            if ($startDate && $endDate) {
              $busyDriverIds = Booking::query()
                ->where('status', '!=', BookingStatus::Rejected->value)
                ->where('start_date', '<', $endDate)
                ->where('end_date', '>', $startDate)
                ->when($record, fn($q) => $q->where('id', '!=', $record->id))
                ->pluck('driver_id');

              $query->whereNotIn('id', $busyDriverIds);
            }

            return $query->pluck('driver_name', 'id');
          })
          ->searchable()
          ->required()
          ->helperText(function (Get $get) {
            if (! $get('start_date') || ! $get('end_date')) {
              return 'Pilih tanggal mulai & selesai terlebih dahulu';
            }

            return null;
          }),
        Textarea::make('purpose')
          ->label('Keperluan')
          ->columnSpanFull()
          ->rows(3)
          ->required(),
        Select::make('approved_l1_id')
          ->label('Approver Level 1')
          ->options(fn() => User::where('role', 'approver')->pluck('username', 'id'))
          ->searchable()
          ->required(),
        Select::make('approved_l2_id')
          ->label('Approver Level 2')
          ->options(fn() => User::where('role', 'approver')->pluck('username', 'id'))
          ->different('approved_l1_id')
          ->searchable()
          ->required(),
      ]);
  }
}
