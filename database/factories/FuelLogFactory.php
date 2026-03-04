<?php

namespace Database\Factories;

use App\Models\Vehicle;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\FuelLog>
 */
class FuelLogFactory extends Factory
{
    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'vehicle_id' => Vehicle::factory(),
            'date' => fake()->date(),
            'liters_added' => fake()->randomFloat(2, 10, 100),
            'cost' => fake()->randomFloat(2, 50000, 500000),
        ];
    }
}
