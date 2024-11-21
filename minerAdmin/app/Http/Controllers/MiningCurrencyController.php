<?php

namespace App\Http\Controllers;

use App\Models\MiningCurrency;
use Exception;
use Illuminate\Http\Request;

class MiningCurrencyController extends Controller
{
    public function index()
    {
        $miningCurrency = MiningCurrency::get();

        return view('miningCurrency.list', ['miningCurrency' => $miningCurrency]);
    }

    public function create(MiningCurrency $miningCurrency)
    {
        return view('miningCurrency.add', [
            'miningCurrency' => $miningCurrency
        ]);
    }

    public function store(Request $request)
    {
        $miningCurrency = new MiningCurrency();
        $miningCurrency->name = $request->get('name');
        $miningCurrency->code = $request->get('code');
        $miningCurrency->amount = $request->get('amount');
        $miningCurrency->status = $request->get('status') ?? 0;
        $miningCurrency->userStatus = $request->get('userStatus') ?? 0;

        try {
            if ($miningCurrency->save()) {
                return back()->with('success', 'Added Successfully');
            }
            return back()->with('error', 'Not Added');
        } catch (Exception $ex) {
            return back()->with('error', $ex);
        }
    }


    public function show(MiningCurrency $miningCurrency)
    {
        return view('miningCurrency.single')->with('miningCurrency', $miningCurrency);
    }

    public function edit(MiningCurrency $miningCurrency)
    {
        return view('miningCurrency.edit', [
            'miningCurrency' => $miningCurrency
        ]);
    }

    public function update(Request $request, MiningCurrency $miningCurrency)
    {
        try {
            $miningCurrency->update([
                $miningCurrency->name = $request->get('name'),
                $miningCurrency->code = $request->get('code'),
                $miningCurrency->amount = $request->get('amount'),
                $miningCurrency->status = $request->get('status') ?? 0,
                $miningCurrency->userStatus = $request->get('userStatus') ?? 0,
            ]);

            return back()->with('success', 'Updated Successfully');
        } catch (Exception $ex) {
            return back()->with('error', 'Not Updated');
        }
    }

    public function destroy(MiningCurrency $miningCurrency)
    {
        try {
            $miningCurrency->delete();
            return back()->with('success', 'Deleted Successfully');
        } catch (Exception $ex) {
            return redirect()->back()->with('error', 'Not Deleted ');
        }
    }

    public function apiGet(Request $request)
    {
        $miningCurrency = MiningCurrency::where('status', 1)->get();
        return $miningCurrency;

    }

    public function apiUserGet(Request $request)
    {
        $miningCurrency = MiningCurrency::where('status', 1)->get();
        return $miningCurrency;

    }
}

