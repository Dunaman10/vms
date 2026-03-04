<?php

namespace App\Models;

use App\Enums\BookingStatus;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Booking extends Model
{
    use HasFactory;

    /**
     * @var list<string>
     */
    protected $fillable = [
        'admin_id',
        'vehicle_id',
        'driver_id',
        'start_date',
        'end_date',
        'purpose',
        'status',
        'approved_l1_id',
        'approved_l2_id',
    ];

    /**
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'status' => BookingStatus::class,
            'start_date' => 'datetime',
            'end_date' => 'datetime',
        ];
    }

    public function admin(): BelongsTo
    {
        return $this->belongsTo(User::class, 'admin_id');
    }

    public function vehicle(): BelongsTo
    {
        return $this->belongsTo(Vehicle::class);
    }

    public function driver(): BelongsTo
    {
        return $this->belongsTo(Driver::class);
    }

    public function approverL1(): BelongsTo
    {
        return $this->belongsTo(User::class, 'approved_l1_id');
    }

    public function approverL2(): BelongsTo
    {
        return $this->belongsTo(User::class, 'approved_l2_id');
    }

    public function bookingApprovals(): HasMany
    {
        return $this->hasMany(BookingApproval::class);
    }
}
