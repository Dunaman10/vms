<?php

namespace App\Filament\Resources\ServiceLogs\Schemas;

use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Schemas\Schema;

class ServiceLogForm
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
        DatePicker::make('service_date')
          ->label('Tanggal Servis')
          ->default(now())
          ->required(),
        Textarea::make('description')
          ->label('Deskripsi Servis')
          ->rows(3)
          ->required(),
        DatePicker::make('next_service_estimate')
          ->label('Estimasi Servis Berikutnya')
          ->after('service_date'),
      ]);
  }
}
