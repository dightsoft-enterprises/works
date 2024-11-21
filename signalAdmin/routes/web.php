<?php

use App\Http\Controllers\AccountsController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\NewsController;
use App\Http\Controllers\PricingController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\TradeController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

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




    Route::controller(TradeController::class)->group(function () {
        Route::get('/trade', 'index')->name('trade');
        Route::post('/trade/search', 'search')->name('trade.search');
        Route::get('/trade/search', 'index');
        Route::get('/trade/add', 'create')->name('trade.add');
        Route::post('/trade/add', 'store')->name('trade.add');
        Route::get('/trade/{trade}/view', 'show');
        Route::get('/trade/{trade}/edit', 'edit');
        Route::put('/trade/{trade}/update', 'update')->name('trade.update');
        Route::get('/trade/{trade}/delete', 'destroy');
    });


    Route::controller(PricingController::class)->group(function () {
        Route::get('/pricing', 'index')->name('pricing');
        Route::get('/pricing/add', 'create')->name('pricing.add');
        Route::post('/pricing/add', 'store')->name('pricing.add');
        Route::get('/pricing/{pricing}/view', 'show');
        Route::get('/pricing/{pricing}/edit', 'edit');
        Route::put('/pricing/{pricing}/update', 'update')->name('pricing.update');
        Route::get('/pricing/{pricing}/delete', 'destroy');
    });

    Route::controller(NewsController::class)->group(function () {
        Route::get('/news', 'index')->name('news');
        Route::get('/news/add', 'create')->name('news.add');
        Route::post('/news/add', 'store')->name('news.add');
        Route::get('/news/{news}/view', 'show');
        Route::get('/news/{news}/edit', 'edit');
        Route::put('/news/{news}/update', 'update')->name('news.update');
        Route::get('/news/{news}/delete', 'destroy');
    });

    Route::controller(AccountsController::class)->group(function () {
        Route::get('/accounts', 'index')->name('accounts');
        Route::get('/accounts/add', 'create')->name('accounts.add');
        Route::post('/accounts/add', 'store')->name('accounts.add');
        Route::get('/accounts/{accounts}/view', 'show');
        Route::get('/accounts/{accounts}/edit', 'edit');
        Route::put('/accounts/{accounts}/update', 'update')->name('accounts.update');
        Route::get('/accounts/{accounts}/delete', 'destroy');
    });

    Route::controller(ContactController::class)->group(function () {
        Route::get('/contact', 'index')->name('contact');
        Route::put('/contact/{contact}/update', 'update')->name('contact.update');
    });
});

require __DIR__ . '/auth.php';
