<?php

namespace App\Filament\Resources\ServiceLogs\Pages;

use App\Filament\Resources\ServiceLogs\ServiceLogResource;
use Filament\Resources\Pages\CreateRecord;

class CreateServiceLog extends CreateRecord
{
    protected static string $resource = ServiceLogResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
