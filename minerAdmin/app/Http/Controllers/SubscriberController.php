<?php

namespace App\Http\Controllers;

use App\Models\GeneralSettings;
use App\Models\Subscriber;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use PHPMailer\PHPMailer\PHPMailer;

class SubscriberController extends Controller
{

    private function getCurrency()
    {

        return array
        (
            'BTC' => 'Bitcoin',
            'ETH' => 'Ethereum',
            'BNB' => 'Binance',
            'USDT' => 'Tether',
            'LTC' => 'Litecoin',
            'TRON' => 'TRON'
        );
    }

    public function index()
    {
        $subscriber = Subscriber::get();
        return view('subscriber.list', ['subscriber' => $subscriber]);
    }

    public function create(Subscriber $subscriber)
    {
        return view('subscriber.add', [
            'subscriber' => $subscriber,
            'appCurrency' => $this->getCurrency()
        ]);
    }

    public function getSettings()
    {
        return GeneralSettings::where('id', 1)->first();
    }

    public function store(Request $request)
    {

        $generalSettings = $this->getSettings();

        $subscriber = new Subscriber();
        $subscriber->firstName = $request->get('firstName');
        $subscriber->lastName = $request->get('lastName');
        $subscriber->phone = $request->get('phone');
        $subscriber->email = $request->get('email');
        $subscriber->country = 'none';
        $subscriber->status = $request->get('status') ?? 0;
        $subscriber->password = $request->get('password');
        $subscriber->code = fake()->randomNumber(6) . "";
        $subscriber->approved = $request->get('approved') ?? 0;
        $subscriber->useDefault = $request->get('useDefault') ?? 0;

        $subscriber->bitcoin = 0.0;
        $subscriber->ethereum = 0.0;
        $subscriber->litecoin = 0.0;
        $subscriber->tron = 0.0;
        $subscriber->binance = 0.0;
        $subscriber->tether = 0.0;
        $subscriber->timeSpent =0;

        $selectedOptions = json_encode($request->get('currency'));
        $subscriber->currency = $selectedOptions;

        $subscriber->bitcoinRate = $generalSettings->bitcoinRate;
        $subscriber->ethereumRate = $generalSettings->ethereumRate;
        $subscriber->litecoinRate = $generalSettings->litecoinRate;
        $subscriber->tronRate = $generalSettings->tronRate;
        $subscriber->binanceRate = $generalSettings->binanceRate;
        $subscriber->tetherRate = $generalSettings->tetherRate;

        $subscriber->bitcoinLimit = $generalSettings->bitcoinLimit;
        $subscriber->ethereumLimit = $generalSettings->ethereumLimit;
        $subscriber->litecoinLimit = $generalSettings->litecoinLimit;
        $subscriber->tronLimit = $generalSettings->tronLimit;
        $subscriber->binanceLimit = $generalSettings->binanceLimit;
        $subscriber->tetherLimit = $generalSettings->tetherLimit;



        $subscriber->timeout = $generalSettings->timeout;
        $subscriber->withdrawalMessage = $generalSettings->withdrawalMessage;
        $subscriber->timeoutMessage = $generalSettings->timeoutMessage;
        $subscriber->gender = $request->get('gender');
        try {
            if ($subscriber->save()) {
                return back()->with('success', 'Added Successfully');
            }
            return back()->with('error', 'Not Added');
        } catch (Exception $ex) {
            return back()->with('error', '');
        }
    }


    public function show(Subscriber $subscriber)
    {
        return view('subscriber.single')->with('subscriber', $subscriber);
    }

    public function edit(Subscriber $subscriber)
    {
        return view('subscriber.edit', [
            'subscriber' => $subscriber,
            'appCurrency' => $this->getCurrency()
        ]);
    }

    public function update(Request $request, Subscriber $subscriber)
    {
        try {
            $subscriber->update([
                $subscriber->firstName = $request->get('firstName'),
                $subscriber->lastName = $request->get('lastName'),
                $subscriber->phone = $request->get('phone'),
                $subscriber->email = $request->get('email'),
                $subscriber->country = $request->get('country'),
                $subscriber->status = $request->get('status') ?? 0,
                $subscriber->password = $request->get('password'),
                $subscriber->code = $request->get('code'),
                $subscriber->approved = $request->get('approved') ?? 0,
                $subscriber->useDefault = $request->get('useDefault') ?? 0,

                $subscriber->bitcoin = $request->get('bitcoin'),
                $subscriber->ethereum = $request->get('ethereum'),
                $subscriber->litecoin = $request->get('litecoin'),
                $subscriber->tron = $request->get('tron'),
                $subscriber->binance = $request->get('binance'),
                $subscriber->tether = $request->get('tether'),
                $subscriber->currency = $request->get('currency'),

                $subscriber->bitcoinRate = $request->get('bitcoinRate'),
                $subscriber->ethereumRate = $request->get('ethereumRate'),
                $subscriber->litecoinRate = $request->get('litecoinRate'),
                $subscriber->tronRate = $request->get('tronRate'),
                $subscriber->binanceRate = $request->get('binanceRate'),
                $subscriber->tetherRate = $request->get('tetherRate'),

                $subscriber->bitcoinLimit = $request->get('bitcoinLimit'),
                $subscriber->ethereumLimit = $request->get('ethereumLimit'),
                $subscriber->litecoinLimit = $request->get('litecoinLimit'),
                $subscriber->tronLimit = $request->get('tronLimit'),
                $subscriber->binanceLimit = $request->get('binanceLimit'),
                $subscriber->tetherLimit = $request->get('tetherLimit'),


                $subscriber->timeout = $request->get('timeout'),
                $subscriber->withdrawalMessage = $request->get('withdrawalMessage'),
                $subscriber->timeoutMessage = $request->get('timeoutMessage'),
                $subscriber->gender = $request->get('gender')

            ]);

            return back()->with('success', 'Updated Successfully');
        } catch (Exception $ex) {
            return back()->with('error', 'NOT UPDATED' . $ex);
        }
    }

    public function destroy(Subscriber $subscriber)
    {
        try {
            $subscriber->delete();
            return back()->with('success', 'Deleted Successfully');
        } catch (Exception $ex) {
            return redirect()->back()->with('error', 'Not Deleted ');
        }
    }


}
