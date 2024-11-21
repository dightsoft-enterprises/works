<?php

use App\Http\Controllers\Api\ApiSubscriberController;
use App\Http\Controllers\GeneralSettingsController;
use App\Http\Controllers\MiningCurrencyController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\SubscriptionPlanController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::post('/withdrawal', [ApiSubscriberController::class, 'withdrawal']);
Route::post('/resend-verification-code', [ApiSubscriberController::class, 'reSendVerificationCode']);
Route::post('/verify-account', [ApiSubscriberController::class, 'verifyAccount']);
Route::post('/register', [ApiSubscriberController::class, 'create']);
Route::post('/user-details', [ApiSubscriberController::class, 'view']);
Route::post('/auth', [ApiSubscriberController::class, 'auth']);
Route::post('/update-coin-balance', [ApiSubscriberController::class, 'updateBalance']);

Route::post('/settings', [GeneralSettingsController::class, 'apiGet']);
Route::post('/notification', [NotificationController::class, 'apiGet']);
Route::post('/notification-create', [NotificationController::class, 'apiCreate']);
Route::post('/currency', [MiningCurrencyController::class, 'apiGet']);
Route::post('/subscriber-currency', [MiningCurrencyController::class, 'apiUserGet']);
Route::post('/pricing', [SubscriptionPlanController::class, 'apiGet']);

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
