<?php

namespace Database\Factories;

use App\Enums\VehicleOwnership;
use App\Enums\VehicleType;
use App\Models\Region;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Vehicle>
 */
class VehicleFactory extends Factory
{
    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'region_id' => Region::factory(),
            'vehicle_name' => fake()->word() . ' ' . fake()->randomNumber(3),
            'licences_plate' => strtoupper(fake()->bothify('?? #### ??')),
            'type' => fake()->randomElement(VehicleType::cases()),
            'ownership' => fake()->randomElement(VehicleOwnership::cases()),
            'fuel_consumtion_rate' => fake()->randomFloat(2, 5, 25),
        ];
    }
}
