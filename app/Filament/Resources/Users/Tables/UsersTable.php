<?php

namespace App\Filament\Resources\Users\Tables;

use Dom\Text;
use Filament\Actions\Action;
use Filament\Actions\ActionGroup;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Schemas\Components\View;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class UsersTable
{
  public static function configure(Table $table): Table
  {
    return $table
      ->columns([
        TextColumn::make('username')
          ->label('Username')
          ->searchable(),
        TextColumn::make('region.region_name')
          ->label('Region')
          ->searchable(),
        TextColumn::make('role')
          ->label('Role')
          ->searchable(),
      ])
      ->filters([
        //
      ])
      ->recordActions([
        ActionGroup::make([
          ViewAction::make(),
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
