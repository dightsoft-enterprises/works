<?php

namespace App\Http\Controllers;

use App\Models\GeneralSettings;
use Exception;
use Illuminate\Http\Request;

class GeneralSettingsController extends Controller
{
    public function index()
    {
        $generalSettings = GeneralSettings::where('id', 1)->first();
        return view('generalSettings.edit', [
            'generalSettings' => $generalSettings
        ]);

    }

    public function show(GeneralSettings $generalSettings)
    {
        return view('generalSettings.single')->with('generalSettings', $generalSettings);
    }

    public function edit(GeneralSettings $generalSettings)
    {
        return view('generalSettings.edit', [
            'generalSettings' => $generalSettings
        ]);
    }


    public function update(Request $request, GeneralSettings $generalSettings)
    {
        try {
            $generalSettings->update([

                $generalSettings->name = $request->get('name'),
                $generalSettings->about = $request->get('about'),
                $generalSettings->phone = $request->get('phone'),
                $generalSettings->email = $request->get('email'),
                $generalSettings->support = $request->get('support'),
                $generalSettings->address = $request->get('address'),
                $generalSettings->firstLevelMessage = $request->get('firstLevelMessage'),
                $generalSettings->message = $request->get('message'),
                $generalSettings->header = $request->get('header'),

                $generalSettings->emailVerification = $request->get('emailVerification')??0,

                $generalSettings->bitcoinRate = $request->get('bitcoinRate'),
                $generalSettings->ethereumRate = $request->get('ethereumRate'),
                $generalSettings->litecoinRate = $request->get('litecoinRate'),
                $generalSettings->tronRate = $request->get('tronRate'),
                $generalSettings->binanceRate = $request->get('binanceRate'),
                $generalSettings->tetherRate = $request->get('tetherRate'),

                $generalSettings->bitcoinLimit = $request->get('bitcoinLimit'),
                $generalSettings->ethereumLimit = $request->get('ethereumLimit'),
                $generalSettings->litecoinLimit = $request->get('litecoinLimit'),
                $generalSettings->tronLimit = $request->get('tronLimit'),
                $generalSettings->binanceLimit = $request->get('binanceLimit'),
                $generalSettings->tetherLimit = $request->get('tetherLimit'),

                $generalSettings->smtpServer = $request->get('smtpServer'),
                $generalSettings->smtpUsername = $request->get('smtpUsername'),
                $generalSettings->smtpSecurity = $request->get('smtpSecurity'),
                $generalSettings->smtpPassword = $request->get('smtpPassword'),
                $generalSettings->smtpPort = $request->get('smtpPort'),
                $generalSettings->smtpEmail = $request->get('smtpEmail'),

                $generalSettings->networkPercentage = $request->get('networkPercentage'),
                $generalSettings->networkHashRate = $request->get('networkHashRate'),
                $generalSettings->poolHashRate = $request->get('poolHashRate'),
                $generalSettings->miners = $request->get('miners'),
                $generalSettings->online = $request->get('online'),
                $generalSettings->currentEffort = $request->get('currentEffort'),
                $generalSettings->blockFound = $request->get('blockFound'),


                $generalSettings->timeout = $request->get('timeout'),
                $generalSettings->withdrawalMessage = $request->get('withdrawalMessage'),
                $generalSettings->timeoutMessage = $request->get('timeoutMessage')
            ]);

            return back()->with('success', 'Updated Successfully');
        } catch (Exception $ex) {
            return back()->with('error', 'Not Updated');
        }
    }


    public function apiGet(Request $request)
    {
        $generalSettings = GeneralSettings::get()->first();
        return $generalSettings;

    }
}
