<?php

namespace App\Models;

use App\Enums\UserRole;
use Filament\Models\Contracts\FilamentUser;
use Filament\Models\Contracts\HasName;
use Filament\Panel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable implements HasName, FilamentUser
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable;

    /**
     * @var list<string>
     */
    protected $fillable = [
        'region_id',
        'username',
        'password',
        'role',
    ];

    /**
     * @var list<string>
     */
    protected $hidden = [
        'password',
    ];

    /**
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'password' => 'hashed',
            'role' => UserRole::class,
        ];
    }

    public function getFilamentName(): string
    {
        return $this->username;
    }

    public function region(): BelongsTo
    {
        return $this->belongsTo(Region::class);
    }

    public function bookings(): HasMany
    {
        return $this->hasMany(Booking::class, 'admin_id');
    }

    public function bookingApprovals(): HasMany
    {
        return $this->hasMany(BookingApproval::class, 'approver_id');
    }

    public function canAccessPanel(Panel $panel): bool
    {
        if ($panel->getId() === 'auth') {
            return true;
        }

        if ($panel->getId() === 'admin') {
            return $this->role === UserRole::Admin;
        }

        if ($panel->getId() === 'approver') {
            return $this->role === UserRole::Approver;
        }

        return false;
    }
}
