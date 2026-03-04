<?php

namespace App\Filament\Approver\Resources\Bookings\Pages;

use App\Filament\Approver\Resources\Bookings\BookingResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListBookings extends ListRecords
{
    protected static string $resource = BookingResource::class;

    protected function getHeaderActions(): array
    {
        return [
            // No create action for standard approver
        ];
    }
}
