<?php

namespace App\Filament\Resources\Vehicles\Schemas;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class VehicleForm
{
  public static function configure(Schema $schema): Schema
  {
    return $schema
      ->columns(1)
      ->components([
        Select::make('region_id')
          ->label('Nama Region')
          ->relationship('region', 'region_name')
          ->required(),
        TextInput::make('vehicle_name')
          ->label('Nama Kendaraan')
          ->required(),
        TextInput::make('licenses_plate')
          ->label('Plat Nomor')
          ->required(),
        Select::make('type')
          ->label('Tipe Kendaraan')
          ->options([
            'Angkutan Orang' => 'Angkutan Orang',
            'Angkutan Barang' => 'Angkutan Barang',
          ])
          ->required(),
        Select::make('ownership')
          ->label('Kepemilikan Kendaraan')
          ->options([
            'Milik Perusahaan' => 'Milik Perusahaan',
            'Sewaan' => 'Sewaan',
          ])
          ->required(),
        TextInput::make('fuel_consumption_rate')
          ->label('Kapasitas Bahan Bakar (Liter)')
          ->suffix('km/liter')
          ->numeric()
          ->required(),
      ]);
  }
}
