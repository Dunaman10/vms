<?php

namespace App\Filament\Resources\Regions;

use App\Filament\Resources\Regions\Pages\CreateRegion;
use App\Filament\Resources\Regions\Pages\EditRegion;
use App\Filament\Resources\Regions\Pages\ListRegions;
use App\Filament\Resources\Regions\Schemas\RegionForm;
use App\Filament\Resources\Regions\Tables\RegionsTable;
use App\Models\Region;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;
use UnitEnum;

class RegionResource extends Resource
{
  public static function canAccess(): bool
  {
    return auth()->user()->role === \App\Enums\UserRole::Admin;
  }
  protected static ?string $model = Region::class;

  protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedMap;
  protected static string | UnitEnum | null $navigationGroup = 'Master Data';
  protected static ?int $navigationSort = 3;
  protected static ?string $navigationLabel = 'Region';
  protected static ?string $label = 'Region';
  protected static ?string $pluralLabel = 'Region';

  public static function form(Schema $schema): Schema
  {
    return RegionForm::configure($schema);
  }

  public static function table(Table $table): Table
  {
    return RegionsTable::configure($table);
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
      'index' => ListRegions::route('/'),
      // 'create' => CreateRegion::route('/create'),
      // 'edit' => EditRegion::route('/{record}/edit'),
    ];
  }
}
