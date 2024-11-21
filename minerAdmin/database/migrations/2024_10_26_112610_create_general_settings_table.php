<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {

        Schema::create('general_settings', function (Blueprint $table) {
            $table->id();
            $table->text('name')->nullable();
            $table->string('phone')->nullable();
            $table->string('email')->nullable();
            $table->string('support')->nullable();
            $table->text('about')->nullable();
            $table->string('address')->nullable();
            $table->string('header')->nullable();
            $table->string('message')->nullable();

            $table->string('smtpServer')->nullable();
            $table->string('smtpUsername')->nullable();
            $table->string('smtpSecurity')->nullable();
            $table->string('smtpPassword')->nullable();
            $table->string('smtpPort')->nullable();
            $table->string('smtpEmail')->nullable();

            $table->double('bitcoinRate')->default(0);
            $table->double('ethereumRate')->default(0);
            $table->double('litecoinRate')->default(0);
            $table->double('tronRate')->default(0);
            $table->double('tetherRate')->default(0);
            $table->double('binanceRate')->default(0);
            $table->Integer('emailVerification')->default(0);

            $table->double('bitcoinLimit')->default(0);
            $table->double('ethereumLimit')->default(0);
            $table->double('litecoinLimit')->default(0);
            $table->double('tronLimit')->default(0);
            $table->double('tetherLimit')->default(0);
            $table->double('binanceLimit')->default(0);


            $table->double('networkPercentage')->nullable();
            $table->double('networkHashRate');
            $table->double('poolHashRate');
            $table->Integer('blockFound');
            $table->Integer('miners')->nullable();
            $table->Integer('online')->nullable();
            $table->double('currentEffort')->nullable();


            $table->Integer('timeout');
            $table->text('firstLevelMessage')->nullable();
            $table->text('withdrawalMessage')->nullable();
            $table->text('timeoutMessage')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('general_settings');
    }
};
