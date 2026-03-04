<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('bookings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('admin_id')->constrained('users')->cascadeOnDelete();
            $table->foreignId('vehicle_id')->constrained('vehicles')->cascadeOnDelete();
            $table->foreignId('driver_id')->constrained('drivers')->cascadeOnDelete();
            $table->datetime('start_date');
            $table->datetime('end_date');
            $table->text('purpose');
            $table->string('status');
            $table->foreignId('approved_l1_id')->nullable()->constrained('users')->nullOnDelete();
            $table->foreignId('approved_l2_id')->nullable()->constrained('users')->nullOnDelete();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bookings');
    }
};
