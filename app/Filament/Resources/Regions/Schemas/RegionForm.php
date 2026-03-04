<?php

namespace App\Filament\Resources\Regions\Schemas;

use Dom\Text;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class RegionForm
{
  public static function configure(Schema $schema): Schema
  {
    return $schema
      ->columns(1)
      ->components([
        TextInput::make('region_name')
          ->label('Nama Region')
          ->required()
          ->maxLength(255),
        Select::make('type')
          ->label('Tipe')
          ->options([
            'Kantor Pusat' => 'Kantor Pusat',
            'Kantor Cabang' => 'Kantor Cabang',
            'Tambang' => 'Tambang',
          ])
          ->required(),
      ]);
  }
}
