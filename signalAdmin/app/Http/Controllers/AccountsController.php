<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Accounts;
use Exception;
use Illuminate\Support\Facades\Log;

class AccountsController extends Controller
{
    public function index()
    {
        $accounts = Accounts::get();

        return view('accounts.list', ['accounts' => $accounts]);
    }


    public function create(Accounts $accounts)
    {
        return view('accounts.add', [
            'accounts' => $accounts
        ]);
    }


    public function store(Request $request)
    {
        $accounts = new Accounts();
        $accounts->remark = $request->get('remark');
        $accounts->code = $request->get('code') ?? '';
        $accounts->type = $request->get('type') ?? '';

        try {
            if ($accounts->save()) {

                return back()->with('success', 'Added Successfully');
            }
            return back()->with('error', 'Not Added');
        } catch (Exception $ex) {
            Log::error($ex);
            return back()->with('error', 'Not Added');
        }
    }


    public function show(Accounts $accounts)
    {
        return view('accounts.single')->with('accounts', $accounts);
    }

    public function edit(Accounts $accounts)
    {

        return view('accounts.edit', [
            'accounts' => $accounts
        ]);
    }



    public function update(Request $request, Accounts $accounts)
    {

        try {


            $accounts->update([

                $accounts->remark = $request->get('remark'),
                $accounts->code = $request->get('code') ?? '',
                $accounts->type = $request->get('type') ?? ''
            ]);

            return back()->with('success', 'Updated Successfully');
        } catch (Exception $ex) {
            Log::error($ex);
            return back()->with('error', 'Not Updated');
        }
    }


    public function destroy(Accounts $accounts)
    {
        try {
            $accounts->delete();
            return back()->with('success', 'Deleted Successfully');
        } catch (Exception $ex) {
            Log::error($ex);
            return redirect()->back()->with('error', 'Not Deleted ');
        }
    }



    public function apiDeviceActivation(Request $request)
    {
        $code = $request->get("code");
        $account =  Accounts::where('code', $code)
            ->where('type', 'DEVICE')->first();

        return $account;
    }

    public function apiBotLevel1(Request $request)
    {
        $code = $request->get("code");
        $account =  Accounts::where('code', $code)
            ->where('type', 'BOT1')->first();

        return $account;
    }

    public function apiBotLevel2(Request $request)
    {
        $code = $request->get("code");
        $account =  Accounts::where('code', $code)
            ->where('type', 'BOT2')->first();

        return $account;
    }


    public function apiSignalLevel1(Request $request)
    {
        $code = $request->get("code");
        $account =  Accounts::where('code', $code)
            ->where('type', 'SIGNAL1')->first();

        return $account;
    }

    public function apiSignalLevel2(Request $request)
    {
        $code = $request->get("code");
        $account =  Accounts::where('code', $code)
            ->where('type', 'SIGNAL2')->first();

        return $account;
    }


}
