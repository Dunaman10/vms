<?php

namespace Database\Factories;

use App\Enums\ApprovalStatus;
use App\Models\Booking;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\BookingApproval>
 */
class BookingApprovalFactory extends Factory
{
    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'booking_id' => Booking::factory(),
            'approver_id' => User::factory()->approver(),
            'level' => fake()->numberBetween(1, 2),
            'status' => fake()->randomElement(ApprovalStatus::cases()),
            'notes' => fake()->optional()->sentence(),
        ];
    }
}
