<?php

namespace App\Filament\Resources\FuelLogs\Schemas;

use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class FuelLogForm
{
  public static function configure(Schema $schema): Schema
  {
    return $schema
      ->columns(1)
      ->components([
        Select::make('vehicle_id')
          ->label('Kendaraan')
          ->relationship('vehicle', 'vehicle_name')
          ->searchable(['vehicle_name', 'licenses_plate'])
          ->preload()
          ->required(),
        DatePicker::make('date')
          ->label('Tanggal')
          ->default(now())
          ->required(),
        TextInput::make('liters_added')
          ->label('Jumlah Liter')
          ->suffix('Liter')
          ->numeric()
          ->minValue(0)
          ->required(),
        TextInput::make('cost')
          ->label('Biaya')
          ->prefix('Rp')
          ->numeric()
          ->minValue(0)
          ->required(),
      ]);
  }
}
