<?php

namespace App\Models;

use App\Enums\DriverStatus;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Driver extends Model
{
    use HasFactory;

    /**
     * @var list<string>
     */
    protected $fillable = [
        'driver_name',
        'status',
    ];

    /**
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'status' => DriverStatus::class,
        ];
    }

    public function bookings(): HasMany
    {
        return $this->hasMany(Booking::class);
    }
}
