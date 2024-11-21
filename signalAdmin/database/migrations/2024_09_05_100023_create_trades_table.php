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
        Schema::create('trades', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->date('startDate');
            $table->date('endDate');
            $table->string('type');
            $table->string('option');
            $table->string('takeProfit');
            $table->string('stopLoss');
            $table->string('profit');
            $table->string('roi');
            $table->string('bot');
            $table->string('currentPair');
            $table->string('maxDrawDown');
            $table->string('status');
            $table->date('publishedOn');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('trades');
    }
};
