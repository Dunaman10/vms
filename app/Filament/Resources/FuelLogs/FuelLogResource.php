<?php

namespace App\Filament\Resources\FuelLogs;

use App\Filament\Resources\FuelLogs\Pages\CreateFuelLog;
use App\Filament\Resources\FuelLogs\Pages\EditFuelLog;
use App\Filament\Resources\FuelLogs\Pages\ListFuelLogs;
use App\Filament\Resources\FuelLogs\Schemas\FuelLogForm;
use App\Filament\Resources\FuelLogs\Tables\FuelLogsTable;
use App\Models\FuelLog;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;
use UnitEnum;

class FuelLogResource extends Resource
{
  public static function canAccess(): bool
  {
    return auth()->user()->role === \App\Enums\UserRole::Admin;
  }
  protected static ?string $model = FuelLog::class;

  protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedFire;
  protected static string | UnitEnum | null $navigationGroup = 'Operational';
  protected static ?int $navigationSort = 3;
  protected static ?string $navigationLabel = 'Konsumsi Bahan Bakar';
  protected static ?string $label = 'Konsumsi Bahan Bakar';
  protected static ?string $pluralLabel = 'Konsumsi Bahan Bakar';


  public static function form(Schema $schema): Schema
  {
    return FuelLogForm::configure($schema);
  }

  public static function table(Table $table): Table
  {
    return FuelLogsTable::configure($table);
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
      'index' => ListFuelLogs::route('/'),
      // 'create' => CreateFuelLog::route('/create'),
      // 'edit' => EditFuelLog::route('/{record}/edit'),
    ];
  }
}
