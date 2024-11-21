<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Trade extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'startDate',
        'endDate',
        'type',
        'option',
        'takeProfit',
        'stopLoss',
        'profit',
        'roi',
        'currentPair',
        'maxDrawDown',
        'status',
        'bot',
        'publishedOn',
        'created_at',
        'updated_at',
    ];
}

