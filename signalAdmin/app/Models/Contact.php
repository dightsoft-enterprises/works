<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
    use HasFactory;

    protected $fillable = [
        'phone',
        'email',
        'telegram',
        'about',
        'address',
        'name',
        'created_at',
        'updated_at',
    ];


}
