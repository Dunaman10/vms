<?php

namespace Database\Factories;

use App\Enums\BookingStatus;
use App\Models\Driver;
use App\Models\User;
use App\Models\Vehicle;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Booking>
 */
class BookingFactory extends Factory
{
    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $startDate = fake()->dateTimeBetween('now', '+1 month');

        return [
            'admin_id' => User::factory()->admin(),
            'vehicle_id' => Vehicle::factory(),
            'driver_id' => Driver::factory(),
            'start_date' => $startDate,
            'end_date' => fake()->dateTimeBetween($startDate, '+2 months'),
            'purpose' => fake()->sentence(),
            'status' => BookingStatus::Pending,
            'approved_l1_id' => null,
            'approved_l2_id' => null,
        ];
    }
}
