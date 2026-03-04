<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class FuelLog extends Model
{
  use HasFactory;

  /**
   * @var list<string>
   */
  protected $fillable = [
    'vehicle_id',
    'date',
    'liters_added',
    'cost',
  ];

  /**
   * @return array<string, string>
   */
  protected function casts(): array
  {
    return [
      'date' => 'date',
      'liters_added' => 'float',
      'cost' => 'decimal:2',
    ];
  }

  public function vehicle(): BelongsTo
  {
    return $this->belongsTo(Vehicle::class);
  }
}
