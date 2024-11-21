<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubscriptionPlan extends Model
{

    use HasFactory;


    protected $fillable = [
        'name',
        'subtitle',
        'amount',
        'status',
        'payment',
        'features',
        'created_at',
        'updated_at',
    ];
}
