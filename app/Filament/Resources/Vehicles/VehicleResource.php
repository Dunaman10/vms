<?php

namespace App\Filament\Resources\Vehicles;

use App\Filament\Resources\Vehicles\Pages\CreateVehicle;
use App\Filament\Resources\Vehicles\Pages\EditVehicle;
use App\Filament\Resources\Vehicles\Pages\ListVehicles;
use App\Filament\Resources\Vehicles\Schemas\VehicleForm;
use App\Filament\Resources\Vehicles\Tables\VehiclesTable;
use App\Models\Vehicle;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;
use UnitEnum;

class VehicleResource extends Resource
{
  public static function canAccess(): bool
  {
    return auth()->user()->role === \App\Enums\UserRole::Admin;
  }
  protected static ?string $model = Vehicle::class;

  protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedTruck;

  protected static string | UnitEnum | null $navigationGroup = 'Master Data';
  protected static ?int $navigationSort = 1;
  protected static ?string $navigationLabel = 'Kendaraan';
  protected static ?string $label = 'Kendaraan';
  protected static ?string $pluralLabel = 'Kendaraan';

  public static function form(Schema $schema): Schema
  {
    return VehicleForm::configure($schema);
  }

  public static function table(Table $table): Table
  {
    return VehiclesTable::configure($table);
  }

  public static function getRelations(): array
  {
    return [
      //
    ];
  }

  public static function getPages(): array
  {
    return [
      'index' => ListVehicles::route('/'),
      // 'create' => CreateVehicle::route('/create'),
      // 'edit' => EditVehicle::route('/{record}/edit'),
    ];
  }
}
