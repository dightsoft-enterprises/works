<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GeneralSettings extends Model
{

    use HasFactory;

    protected $fillable = [
        'name',

        'about',
        'phone',
        'email',
        'support',
        'address',
        'header',
        'message',
        'emailVerification',

        'smtpServer',
        'smtpUsername',
        'smtpSecurity',
        'smtpPassword',
        'smtpEmail',
        'smtpPort',

        'networkPercentage',
        'networkHashRate',
        'poolHashRate',
        'miners',
        'online',
        'currentEffort',
        'blockFound',

        'bitcoinRate',
        'ethereumRate',
        'litecoinRate',
        'tronRate',
        'binanceRate',
        'tetherRate',

        'bitcoinLimit',
        'ethereumLimit',
        'litecoinLimit',
        'tronLimit',
        'binanceLimit',
        'tetherLimit',

        'timeout',
        'firstLevelMessage',
        'withdrawalMessage',
        'timeoutMessage',
        'created_at',
        'updated_at',
    ];
}
