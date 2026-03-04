<?php

namespace Database\Seeders;

use App\Enums\RegionType;
use App\Enums\UserRole;
use App\Models\Region;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Create an initial region directly
        $region = Region::create([
            'region_name' => 'Kantor Pusat',
            'type' => RegionType::KantorPusat,
        ]);

        // Create initial user directly without using factories
        User::create([
            'region_id' => $region->id,
            'username' => 'admin',
            'password' => Hash::make('password'),
            'role' => UserRole::Admin,
        ]);
    }
}
