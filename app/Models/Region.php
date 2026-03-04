<?php

namespace App\Models;

use App\Enums\RegionType;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Region extends Model
{
    use HasFactory;

    /**
     * @var list<string>
     */
    protected $fillable = [
        'region_name',
        'type',
    ];

    /**
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'type' => RegionType::class,
        ];
    }

    public function users(): HasMany
    {
        return $this->hasMany(User::class);
    }

    public function vehicles(): HasMany
    {
        return $this->hasMany(Vehicle::class);
    }
}
