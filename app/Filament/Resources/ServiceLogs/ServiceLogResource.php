<?php

namespace App\Filament\Resources\ServiceLogs;

use App\Filament\Resources\ServiceLogs\Pages\CreateServiceLog;
use App\Filament\Resources\ServiceLogs\Pages\EditServiceLog;
use App\Filament\Resources\ServiceLogs\Pages\ListServiceLogs;
use App\Filament\Resources\ServiceLogs\Schemas\ServiceLogForm;
use App\Filament\Resources\ServiceLogs\Tables\ServiceLogsTable;
use App\Models\ServiceLog;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;
use UnitEnum;

class ServiceLogResource extends Resource
{
  public static function canAccess(): bool
  {
    return auth()->user()->role === \App\Enums\UserRole::Admin;
  }
  protected static ?string $model = ServiceLog::class;

  protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedWrenchScrewdriver;
  protected static string | UnitEnum | null $navigationGroup = 'Operational';
  protected static ?int $navigationSort = 4;
  protected static ?string $navigationLabel = 'Jadwal Servis';
  protected static ?string $label = 'Jadwal Servis';
  protected static ?string $pluralLabel = 'Jadwal Servis';


  public static function form(Schema $schema): Schema
  {
    return ServiceLogForm::configure($schema);
  }

  public static function table(Table $table): Table
  {
    return ServiceLogsTable::configure($table);
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
      'index' => ListServiceLogs::route('/'),
      // 'create' => CreateServiceLog::route('/create'),
      // 'edit' => EditServiceLog::route('/{record}/edit'),
    ];
  }
}
