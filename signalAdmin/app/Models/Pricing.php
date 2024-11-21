<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pricing extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'amount',
        'dailyReturns',
        'weeklyReturns',
        'minDeposit',
        'maxDeposit',
        'maxDrawDown',
        'phoneOrComputer',
        'noLossTrading',
        'proFirmTrading',
        'newsTrading',
        'takeProfit',
        'stopLoss',
        'tradingOptimization',
        'liveDemo',
        'deviceLabel',
        'device',
        'currencyPair',
        'created_at',
        'updated_at',
    ];
}
