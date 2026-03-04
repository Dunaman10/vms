<?php

namespace App\Filament\Resources\Bookings\Pages;

use App\Enums\BookingStatus;
use App\Filament\Resources\Bookings\BookingResource;
use Filament\Resources\Pages\CreateRecord;

class CreateBooking extends CreateRecord
{
    protected static string $resource = BookingResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $data['admin_id'] = auth()->id();
        $data['status'] = BookingStatus::Pending->value;

        return $data;
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
