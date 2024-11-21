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



        Schema::create('pricings', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('amount');
            $table->string('dailyReturns');
            $table->string('weeklyReturns');
            $table->string('minDeposit');
            $table->string('maxDeposit');
            $table->string('maxDrawDown');
            $table->string('phoneOrComputer');
            $table->string('deviceLabel');
            $table->string('device');
            $table->string('noLossTrading');
            $table->string('proFirmTrading');
            $table->string('newsTrading');
            $table->string('takeProfit');
            $table->string('stopLoss');
            $table->string('tradingOptimization');
            $table->string('liveDemo');
            $table->string('currencyPair');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pricings');
    }
};


