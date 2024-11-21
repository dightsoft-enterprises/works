<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MiningCurrency extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'code',
        'amount',
        'status',
        'userStatus',
        'created_at',
        'updated_at',
    ];
}
