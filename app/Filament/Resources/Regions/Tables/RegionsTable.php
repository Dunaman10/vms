<?php

namespace App\Filament\Resources\Regions\Tables;

use Filament\Actions\ActionGroup;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class RegionsTable
{
  public static function configure(Table $table): Table
  {
    return $table
      ->columns([
        TextColumn::make('region_name')
          ->label('Nama Wilayah')
          ->searchable(),
        TextColumn::make('type')
          ->label('Tipe')
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
