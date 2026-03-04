<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ServiceLog extends Model
{
    use HasFactory;

    /**
     * @var string
     */
    protected $table = 'services_logs';

    /**
     * @var list<string>
     */
    protected $fillable = [
        'vehicle_id',
        'service_date',
        'description',
        'next_service_estimate',
    ];

    /**
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'service_date' => 'date',
            'next_service_estimate' => 'date',
        ];
    }

    public function vehicle(): BelongsTo
    {
        return $this->belongsTo(Vehicle::class);
    }
}
