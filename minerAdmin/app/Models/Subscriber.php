<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subscriber extends Model
{

    use HasFactory;

    protected $fillable = [
        'firstName',
        'lastName',
        'phone',
        'email',

        'country',
        'password',
        'code',
        'status',
        'approved',
        'bitcoin',
        'ethereum',
        'litecoin',
        'tron',
        'binance',
        'tether',


        'bitcoinLimit',
        'ethereumLimit',
        'litecoinLimit',
        'tronLimit',
        'binanceLimit',
        'tetherLimit',

        'bitcoinRate',
        'ethereumRate',
        'litecoinRate',
        'tronRate',
        'binanceRate',
        'tetherRate',
        'timeout',

        'useDefault',

        'currency',
        'withdrawalMessage',
        'timeoutMessage',
        'gender',
        'created_at',
        'updated_at',
    ];
}
