<?php

use App\Http\Controllers\AccountsController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\NewsController;
use App\Http\Controllers\TradeController;
use App\Http\Controllers\PricingController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('/contact', [ContactController::class, 'api']);
Route::post('/trade', [TradeController::class, 'api']);
Route::post('/pricing', [PricingController::class, 'api']);
Route::post('/signal', [TradeController::class, 'api']);
Route::post('/news', [NewsController::class, 'api']);
Route::post('/device-activation', [AccountsController::class, 'apiDeviceActivation']);
Route::post('/bot-level-1', [AccountsController::class, 'apiBotLevel1']);
Route::post('/bot-level-2', [AccountsController::class, 'apiBotLevel2']);
Route::post('/signal-level-1', [AccountsController::class, 'apiSignalLevel1']);
Route::post('/signal-level-2', [AccountsController::class, 'apiSignalLevel2']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
