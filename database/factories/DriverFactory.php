<?php

namespace Database\Factories;

use App\Enums\DriverStatus;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Driver>
 */
class DriverFactory extends Factory
{
    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'driver_name' => fake()->name(),
            'status' => DriverStatus::Available,
        ];
    }

    public function onDuty(): static
    {
        return $this->state(fn (array $attributes) => [
            'status' => DriverStatus::OnDuty,
        ]);
    }
}
