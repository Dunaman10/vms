<?php

namespace App\Models;

use App\Enums\VehicleOwnership;
use App\Enums\VehicleType;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Vehicle extends Model
{
  use HasFactory;

  /**
   * @var list<string>
   */
  protected $fillable = [
    'region_id',
    'vehicle_name',
    'licenses_plate',
    'type',
    'ownership',
    'fuel_consumption_rate',
  ];

  /**
   * @return array<string, string>
   */
  protected function casts(): array
  {
    return [
      'type' => VehicleType::class,
      'ownership' => VehicleOwnership::class,
      'fuel_consumtion_rate' => 'float',
    ];
  }

  public function region(): BelongsTo
  {
    return $this->belongsTo(Region::class);
  }

  public function bookings(): HasMany
  {
    return $this->hasMany(Booking::class);
  }

  public function fuelLogs(): HasMany
  {
    return $this->hasMany(FuelLog::class);
  }

  public function serviceLogs(): HasMany
  {
    return $this->hasMany(ServiceLog::class);
  }
}
