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

        Schema::create('subscribers', function (Blueprint $table) {
            $table->id();
            $table->string('phone')->nullable();
            $table->string('email')->nullable();
            $table->string('firstName')->nullable();
            $table->string('lastName')->nullable();
            $table->string('password')->nullable();
            $table->string('country')->nullable();
            $table->Integer('status')->default(0);
            $table->Integer('approved')->default(0);
            $table->Integer('useDefault')->default(0);
            $table->string('code')->nullable();

            $table->text('currency')->nullable();

            $table->double('bitcoin')->default(0);
            $table->double('ethereum')->default(0);
            $table->double('litecoin')->default(0);
            $table->double('tron')->default(0);
            $table->double('tether')->default(0);
            $table->double('binance')->default(0);


            $table->double('bitcoinRate')->default(0);
            $table->double('ethereumRate')->default(0);
            $table->double('litecoinRate')->default(0);
            $table->double('tronRate')->default(0);
            $table->double('tetherRate')->default(0);
            $table->double('binanceRate')->default(0);

            $table->double('bitcoinLimit')->default(0);
            $table->double('ethereumLimit')->default(0);
            $table->double('litecoinLimit')->default(0);
            $table->double('tronLimit')->default(0);
            $table->double('tetherLimit')->default(0);
            $table->double('binanceLimit')->default(0);

            $table->Integer('timeout');
            $table->string('gender')->nullable();
            $table->longText('withdrawalMessage')->nullable();
            $table->longText('timeoutMessage')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('subscribers');
    }
};
