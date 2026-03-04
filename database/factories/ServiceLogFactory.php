<?php

namespace Database\Factories;

use App\Models\Vehicle;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ServiceLog>
 */
class ServiceLogFactory extends Factory
{
    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $serviceDate = fake()->date();

        return [
            'vehicle_id' => Vehicle::factory(),
            'service_date' => $serviceDate,
            'description' => fake()->sentence(),
            'next_service_estimate' => fake()->optional()->dateTimeBetween($serviceDate, '+6 months')?->format('Y-m-d'),
        ];
    }
}
