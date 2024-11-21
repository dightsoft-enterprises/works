<?php

use App\Http\Controllers\GeneralSettingsController;
use App\Http\Controllers\MiningCurrencyController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\SubscriberController;
use App\Http\Controllers\SubscriptionPlanController;

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');



    Route::controller(GeneralSettingsController::class)->group(function () {
        Route::get('/general-settings', 'index')->name('generalSettings');
        Route::put('/general-settings/{generalSettings}/update', 'update')->name('generalSettings.update');
    });


    Route::controller(SubscriptionPlanController::class)->group(function () {
        Route::get('/subscriptionPlan', 'index')->name('subscriptionPlan');
        Route::get('/subscriptionPlan/add', 'create')->name('subscriptionPlan.add');
        Route::post('/subscriptionPlan/add', 'store')->name('subscriptionPlan.add');
        Route::get('/subscriptionPlan/{subscriptionPlan}/view', 'show');
        Route::get('/subscriptionPlan/{subscriptionPlan}/edit', 'edit');
        Route::put('/subscriptionPlan/{subscriptionPlan}/update', 'update')->name('subscriptionPlan.update');
        Route::get('/subscriptionPlan/{subscriptionPlan}/delete', 'destroy');
    });


    Route::controller(SubscriberController::class)->group(function () {
        Route::get('/subscriber', 'index')->name('subscriber');
        Route::get('/subscriber/add', 'create')->name('subscriber.add');
        Route::post('/subscriber/add', 'store')->name('subscriber.add');
        Route::get('/subscriber/{subscriber}/view', 'show');
        Route::get('/subscriber/{subscriber}/edit', 'edit');
        Route::put('/subscriber/{subscriber}/update', 'update')->name('subscriber.update');
        Route::get('/subscriber/{subscriber}/delete', 'destroy');
    });

    Route::controller(NotificationController::class)->group(function () {
        Route::get('/notification', 'index')->name('notification');
        Route::get('/notification/add', 'create')->name('notification.add');
        Route::post('/notification/add', 'store')->name('notification.add');
        Route::get('/notification/{notification}/view', 'show');
        Route::get('/notification/{notification}/edit', 'edit');
        Route::put('/notification/{notification}/update', 'update')->name('notification.update');
        Route::get('/notification/{notification}/delete', 'destroy');
    });

    Route::controller(MiningCurrencyController::class)->group(function () {
        Route::get('/miningCurrency', 'index')->name('miningCurrency');
        Route::get('/miningCurrency/add', 'create')->name('miningCurrency.add');
        Route::post('/miningCurrency/add', 'store')->name('miningCurrency.add');
        Route::get('/miningCurrency/{miningCurrency}/view', 'show');
        Route::get('/miningCurrency/{miningCurrency}/edit', 'edit');
        Route::put('/miningCurrency/{miningCurrency}/update', 'update')->name('miningCurrency.update');
        Route::get('/miningCurrency/{miningCurrency}/delete', 'destroy');
    });



});



require __DIR__.'/auth.php';
