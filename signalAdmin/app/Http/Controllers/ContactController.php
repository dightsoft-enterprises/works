<?php

namespace App\Http\Controllers;

use App\Models\Contact;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Exception;

class ContactController extends Controller
{
    public function index()
    {
        $contact = Contact::where('id', 1)->first();


        return view('contact.edit', [
            'contact' => $contact
        ]);


    }


    public function update(Request $request, Contact $contact)
    {

        try {

            $contact->update([
                $contact->phone = $request->get('phone'),
                $contact->email = $request->get('email'),
                $contact->telegram = $request->get('telegram'),
                $contact->about = $request->get('about'),
                $contact->name = $request->get('name'),
                $contact->address = $request->get('address') ?? '',

            ]);

            return back()->with('success', 'Updated Successfully');
        } catch (Exception $ex) {
            Log::error($ex);
            return back()->with('error', 'Not Updated');
        }
    }


    public function api(Request $request)
    {
        $trades =  Contact::where('id', 1)->first();

        return $trades;
    }

}
