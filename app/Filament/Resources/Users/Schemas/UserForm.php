<?php

namespace App\Filament\Resources\Users\Schemas;

use App\Models\Region;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class UserForm
{
  public static function configure(Schema $schema): Schema
  {
    return $schema
      ->columns(1)
      ->components([
        TextInput::make('username')
          ->label('Username')
          ->placeholder('Masukkan username')
          ->required()
          ->maxLength(255),
        TextInput::make('password')
          ->label('Password')
          ->placeholder('Masukkan password')
          ->required()
          ->maxLength(255)
          ->revealable()
          ->password(),
        Select::make('region_id')
          ->label('Region')
          ->placeholder('Pilih region')
          ->options(Region::all()->pluck('region_name', 'id'))
          ->searchable()
          ->required(),
        Select::make('role')
          ->label('Role')
          ->placeholder('Pilih role')
          ->options([
            'admin' => 'Admin',
            'approver' => 'Approver',
          ])
          ->required(),
      ]);
  }
}
