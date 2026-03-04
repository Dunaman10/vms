<?php

namespace App\Filament\Resources\FuelLogs\Tables;

use Filament\Actions\ActionGroup;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class FuelLogsTable
{
  public static function configure(Table $table): Table
  {
    return $table
      ->columns([
        TextColumn::make('vehicle.vehicle_name')
          ->label('Kendaraan')
          ->description(fn($record) => $record->vehicle?->licences_plate)
          ->searchable(),
        TextColumn::make('date')
          ->label('Tanggal')
          ->date('d M Y')
          ->alignCenter()
          ->sortable(),
        TextColumn::make('liters_added')
          ->label('Jumlah Liter')
          ->suffix(' Liter')
          ->alignCenter()
          ->sortable(),
        TextColumn::make('cost')
          ->label('Biaya')
          ->money('Rp.')
          ->alignCenter()
          ->sortable(),
      ])
      ->defaultSort('date', 'desc')
      ->filters([
        //
      ])
      ->recordActions([
        ActionGroup::make([
          EditAction::make(),
          DeleteAction::make(),
        ]),
      ])
      ->toolbarActions([
        BulkActionGroup::make([
          DeleteBulkAction::make(),
        ]),
      ]);
  }
}
