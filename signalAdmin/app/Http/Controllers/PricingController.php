<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pricing;
use Exception;
use Illuminate\Support\Facades\Log;


class PricingController extends Controller
{
    public function index()
    {
        $pricing = Pricing::get();

        return view('pricing.list', ['pricing' => $pricing]);
    }


    public function create(Pricing $pricing)
    {
        return view('pricing.add', [
            'pricing' => $pricing
        ]);
    }


    public function store(Request $request)
    {


        $pricing = new Pricing();
        $pricing->name = $request->get('name');
        $pricing->amount = $request->get('amount');
        $pricing->maxDrawDown = $request->get('maxDrawDown');
        $pricing->minDeposit = $request->get('minDeposit');
        $pricing->maxDeposit = $request->get('maxDeposit') ?? '';
        $pricing->dailyReturns = $request->get('dailyReturns') ?? '';
        $pricing->phoneOrComputer = $request->get('phoneOrComputer') ?? '';
        $pricing->noLossTrading = $request->get('noLossTrading') ?? '';
        $pricing->proFirmTrading = $request->get('proFirmTrading') ?? '';
        $pricing->newsTrading = $request->get('newsTrading') ?? '';
        $pricing->weeklyReturns = $request->get('weeklyReturns') ?? '';
        $pricing->takeProfit = $request->get('takeProfit') ?? '';
        $pricing->stopLoss = $request->get('stopLoss') ?? '';
        $pricing->tradingOptimization = $request->get('tradingOptimization') ?? '';
        $pricing->liveDemo = $request->get('liveDemo') ?? '';
        $pricing->currencyPair = $request->get('currencyPair') ?? '';
        $pricing->deviceLabel = $request->get('deviceLabel') ?? '';
        $pricing->device = $request->get('device') ?? '';

        try {
            if ($pricing->save()) {

                return back()->with('success', 'Added Successfully');
            }
            return back()->with('error', 'Not Added');
        } catch (Exception $ex) {
            Log::error($ex);
            return back()->with('error', $ex);
        }
    }


    public function show(Pricing $pricing)
    {
        return view('pricing.single')->with('pricing', $pricing);
    }

    public function edit(Pricing $pricing)
    {

        return view('pricing.edit', [
            'pricing' => $pricing
        ]);
    }



    public function update(Request $request, Pricing $pricing)
    {

        try {


            $pricing->update([
                $pricing->currencyPair = $request->get('currencyPair') ?? '',
                $pricing->name = $request->get('name'),
                $pricing->amount = $request->get('amount'),
                $pricing->maxDrawDown = $request->get('maxDrawDown'),
                $pricing->minDeposit = $request->get('minDeposit'),
                $pricing->maxDeposit = $request->get('maxDeposit') ?? '',
                $pricing->dailyReturns = $request->get('dailyReturns') ?? '',
                $pricing->weeklyReturns = $request->get('weeklyReturns') ?? '',
                $pricing->phoneOrComputer = $request->get('phoneOrComputer') ?? '',
                $pricing->noLossTrading = $request->get('noLossTrading') ?? '',
                $pricing->proFirmTrading = $request->get('proFirmTrading') ?? '',
                $pricing->newsTrading = $request->get('newsTrading') ?? '',
                $pricing->takeProfit = $request->get('takeProfit') ?? '',
                $pricing->stopLoss = $request->get('stopLoss') ?? '',
                $pricing->tradingOptimization = $request->get('tradingOptimization') ?? '',
                $pricing->liveDemo = $request->get('liveDemo') ?? '',
                $pricing->deviceLabel = $request->get('deviceLabel') ?? '',
                $pricing->device = $request->get('device') ?? '',
            ]);

            return back()->with('success', 'Updated Successfully');
        } catch (Exception $ex) {
            Log::error($ex);
            return back()->with('error', 'Not Updated');
        }
    }


    public function destroy(Pricing $pricing)
    {
        try {
            $pricing->delete();
            return back()->with('success', 'Deleted Successfully');
        } catch (Exception $ex) {
            Log::error($ex);
            return redirect()->back()->with('error', 'Not Deleted ');
        }
    }


    public function api(Request $request)
    {
        $trades =  Pricing::get();

        return $trades;
    }
}
