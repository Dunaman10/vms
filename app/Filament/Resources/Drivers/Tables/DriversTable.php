<?php

namespace App\Filament\Resources\Drivers\Tables;

use Filament\Actions\ActionGroup;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class DriversTable
{
  public static function configure(Table $table): Table
  {
    return $table
      ->columns([
        TextColumn::make('driver_name')
          ->label('Nama Pengemudi')
          ->searchable(),
        TextColumn::make('status')
          ->label('Status')
          ->searchable(),
      ])
      ->filters([
        //
      ])
      ->recordActions([
        ActionGroup::make([
          EditAction::make(),
          DeleteAction::make(),
        ])
      ])
      ->toolbarActions([
        BulkActionGroup::make([
          DeleteBulkAction::make(),
        ]),
      ]);
  }
}
