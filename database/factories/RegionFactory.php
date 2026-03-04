<?php

namespace Database\Factories;

use App\Enums\RegionType;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Region>
 */
class RegionFactory extends Factory
{
    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'region_name' => fake()->city(),
            'type' => fake()->randomElement(RegionType::cases()),
        ];
    }

    public function hq(): static
    {
        return $this->state(fn (array $attributes) => [
            'type' => RegionType::Hq,
        ]);
    }

    public function branch(): static
    {
        return $this->state(fn (array $attributes) => [
            'type' => RegionType::Branch,
        ]);
    }

    public function mine(): static
    {
        return $this->state(fn (array $attributes) => [
            'type' => RegionType::Mine,
        ]);
    }
}
