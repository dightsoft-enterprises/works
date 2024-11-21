<?php

namespace App\Http\Controllers;

use App\Models\SubscriptionPlan;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class SubscriptionPlanController extends Controller
{
    public function index()
    {
        $subscriptionPlan = SubscriptionPlan::get();

        return view('subscriptionPlan.list', ['subscriptionPlan' => $subscriptionPlan]);
    }

    public function create(SubscriptionPlan $subscriptionPlan)
    {
        return view('subscriptionPlan.add', [
            'subscriptionPlan' => $subscriptionPlan
        ]);
    }

    public function store(Request $request)
    {
        $subscriptionPlan = new SubscriptionPlan();
        $subscriptionPlan->name = $request->get('name');
        $subscriptionPlan->payment = $request->get('payment');
        $subscriptionPlan->subtitle = $request->get('subtitle');
        $subscriptionPlan->amount = $request->get('amount');
        $subscriptionPlan->features = $request->get('features');
        $subscriptionPlan->status = $request->get('status')?? 0;

        try {
            if ($subscriptionPlan->save()) {
                return back()->with('success', 'Added Successfully');
            }
            return back()->with('error', 'Not Added');
        } catch (Exception $ex) {
            Log::error($ex);
            return back()->with('error', $ex);
        }
    }


    public function show(SubscriptionPlan $subscriptionPlan)
    {
        return view('subscriptionPlan.single')->with('subscriptionPlan', $subscriptionPlan);
    }

    public function edit(SubscriptionPlan $subscriptionPlan)
    {
        return view('subscriptionPlan.edit', [
            'subscriptionPlan' => $subscriptionPlan
        ]);
    }

    public function update(Request $request, SubscriptionPlan $subscriptionPlan)
    {
        try {
            $subscriptionPlan->update([
                $subscriptionPlan->name = $request->get('name'),
                $subscriptionPlan->payment = $request->get('payment'),
                $subscriptionPlan->subtitle = $request->get('subtitle'),
                $subscriptionPlan->amount = $request->get('amount'),
                $subscriptionPlan->features = $request->get('features'),
                $subscriptionPlan->status = $request->get('status')?? 0,
            ]);

            return back()->with('success', 'Updated Successfully');
        } catch (Exception $ex) {

            return back()->with('error', 'Not Updated');
        }
    }

    public function destroy(SubscriptionPlan $subscriptionPlan)
    {
        try {
            $subscriptionPlan->delete();
            return back()->with('success', 'Deleted Successfully');
        } catch (Exception $ex) {
            return redirect()->back()->with('error', 'Not Deleted ');
        }
    }

    public function apiGet(Request $request)
    {
        $subscriptionPlan = SubscriptionPlan::where('status', 1)->get();
        return $subscriptionPlan;

    }
}
