<?php

namespace App\Filament\Resources\Drivers\Schemas;

use App\Enums\DriverStatus;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class DriverForm
{
  public static function configure(Schema $schema): Schema
  {
    return $schema
      ->columns(1)
      ->components([
        TextInput::make('driver_name')
          ->label('Nama Pengemudi')
          ->required(),
        Select::make('status')
          ->label('Status')
          ->options([
            'Tersedia' => 'Tersedia',
            'Sedang Bertugas' => 'Sedang Bertugas',
          ])
          ->required(),
      ]);
  }
}
