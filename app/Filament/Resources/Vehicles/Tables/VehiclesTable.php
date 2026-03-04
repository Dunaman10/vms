<?php

namespace App\Filament\Resources\Vehicles\Tables;

use Filament\Actions\ActionGroup;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class VehiclesTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                // TextColumn::make('region.region_name')
                //   ->label('Region')
                //   ->searchable(),
                TextColumn::make('vehicle_name')
                    ->label('Nama Kendaraan')
                    ->alignCenter()
                    ->searchable(),
                TextColumn::make('licenses_plate')
                    ->label('Plat Nomor')
                    ->alignCenter()
                    ->searchable(),
                TextColumn::make('type')
                    ->label('Tipe Kendaraan')
                    ->alignCenter(),
                TextColumn::make('ownership')
                    ->label('Kepemilikan Kendaraan')
                    ->alignCenter(),
                TextColumn::make('fuel_consumption_rate')
                    ->label('Kapasitas Bahan Bakar')
                    ->suffix('km/liter')
                    ->alignCenter(),
            ])
            ->filters([
                //
            ])
            ->recordActions([
                ActionGroup::make([
                    ViewAction::make(),
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
