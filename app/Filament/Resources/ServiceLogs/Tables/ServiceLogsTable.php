<?php

namespace App\Filament\Resources\ServiceLogs\Tables;

use Filament\Actions\ActionGroup;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class ServiceLogsTable
{
  public static function configure(Table $table): Table
  {
    return $table
      ->columns([
        TextColumn::make('vehicle.vehicle_name')
          ->label('Kendaraan')
          ->description(fn ($record) => $record->vehicle?->licences_plate)
          ->searchable(),
        TextColumn::make('service_date')
          ->label('Tanggal Servis')
          ->date('d M Y')
          ->alignCenter()
          ->sortable(),
        TextColumn::make('description')
          ->label('Deskripsi')
          ->limit(40),
        TextColumn::make('next_service_estimate')
          ->label('Servis Berikutnya')
          ->date('d M Y')
          ->alignCenter()
          ->sortable()
          ->placeholder('-'),
      ])
      ->defaultSort('service_date', 'desc')
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
