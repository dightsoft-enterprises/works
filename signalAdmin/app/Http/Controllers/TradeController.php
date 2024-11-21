<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Trade;
use Exception;
use Illuminate\Support\Facades\Log;


class TradeController extends Controller
{
    public function index()
    {

        //$trades = Trade::get();

        $startDate = now()->startOfMonth();
        $endDate = now()->endOfMonth();

        $trades =  Trade::where('created_at', '>=', $startDate)->where('created_at', '<=', $endDate)->get();

        return view('trade.list', ['trades' => $trades]);
    }


    public function search(Request $request)
    {
        $startDate = $request->get('startDate');
        $endDate = $request->get('endDate');

        $trades =  Trade::where('created_at', '>=', $startDate)
            ->where('created_at', '<=', $endDate)
            ->get();

        return view('trade.list', ['trades' => $trades]);
    }


    public function create(Trade $trade)
    {
        return view('trade.add', [
            'trade' => $trade
        ]);
    }



    public function store(Request $request)
    {
        $trade = new Trade();
        $trade->name = $request->get('name');
        $trade->startDate = $request->get('startDate');
        $trade->endDate = $request->get('endDate');
        $trade->type = $request->get('type');
        $trade->roi = $request->get('roi');
        $trade->option = $request->get('option') ?? '';
        $trade->takeProfit = $request->get('takeProfit') ?? '';
        $trade->stopLoss = $request->get('stopLoss') ?? '';
        $trade->profit = $request->get('profit') ?? '';
        $trade->currentPair = $request->get('currentPair');
        $trade->maxDrawDown = $request->get('maxDrawDown') ?? '';
        $trade->bot = $request->get('bot') ?? '';
        $trade->status = $request->get('status');
        $trade->publishedOn = $request->get('publishedOn');



        try {
            if ($trade->save()) {

                return back()->with('success', 'Added Successfully');
            }
            return back()->with('error', 'Not Added');
        } catch (Exception $ex) {
            Log::error($ex);
            return back()->with('error', 'Not Added');
        }
    }


    public function show(Trade $trade)
    {
        return view('trade.single')->with('trade', $trade);
    }

    public function edit(Trade $trade)
    {

        return view('trade.edit', [
            'trade' => $trade
        ]);
    }



    public function update(Request $request, Trade $trade)
    {

        try {


            $trade->update([
                $trade->name = $request->get('name'),
                $trade->startDate = $request->get('startDate'),
                $trade->endDate = $request->get('endDate'),
                $trade->type = $request->get('type'),
                $trade->roi = $request->get('roi'),
                $trade->bot = $request->get('bot') ?? '',
                $trade->option = $request->get('option') ?? '',
                $trade->takeProfit = $request->get('takeProfit') ?? '',
                $trade->stopLoss = $request->get('stopLoss') ?? '',
                $trade->profit = $request->get('profit') ?? '',
                $trade->currentPair = $request->get('currentPair'),
                $trade->maxDrawDown = $request->get('maxDrawDown') ?? '',
                $trade->status = $request->get('status'),
                $trade->publishedOn = $request->get('publishedOn'),
            ]);

            return back()->with('success', 'Updated Successfully');
        } catch (Exception $ex) {
            Log::error($ex);
            return back()->with('error', 'Not Updated');
        }
    }


    public function destroy(Trade $trade)
    {
        try {
            $trade->delete();
            return back()->with('success', 'Deleted Successfully');
        } catch (Exception $ex) {
            Log::error($ex);
            return redirect()->back()->with('error', 'Not Deleted ');
        }
    }



    public function api(Request $request)
    {


        $startDate = $request->get('createdDateFrom');
        $endDate = $request->get('createdDateEnd');

        if ($endDate == null ||  $startDate == null) {
            return Trade::where('status', '<>', 'running')
                ->where('created_at', '>=',  now()->startOfMonth())->where('created_at', '<=', now()->endOfMonth())->get();
        }

        $trades =  Trade::where('status', '<>', 'running')
            ->where('created_at', '>=', $startDate)->where('created_at', '<=', $endDate)->get();

        return $trades;
    }


    public function signalApi(Request $request)
    {

        return Trade::where('status', 'signal')->get();
    }
}
