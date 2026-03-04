<?php

namespace Database\Factories;

use App\Enums\UserRole;
use App\Models\Region;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class UserFactory extends Factory
{
    /**
     * The current password being used by the factory.
     */
    protected static ?string $password;

    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'region_id' => Region::factory(),
            'username' => fake()->userName(),
            'password' => static::$password ??= Hash::make('password'),
            'role' => fake()->randomElement(UserRole::cases()),
        ];
    }

    public function admin(): static
    {
        return $this->state(fn (array $attributes) => [
            'role' => UserRole::Admin,
        ]);
    }

    public function approver(): static
    {
        return $this->state(fn (array $attributes) => [
            'role' => UserRole::Approver,
        ]);
    }
}
