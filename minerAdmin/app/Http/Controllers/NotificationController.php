<?php

namespace App\Http\Controllers;

use App\Models\Notification;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Kreait\Firebase\Factory;
use Kreait\Firebase\Messaging\CloudMessage;


class NotificationController extends Controller
{

    private function firebaseApi($header, $content)
    {
        $credentialsFilePath = Storage::path('/firebase-adminsdk-6din2-3564b4f704.json');
        $factory = (new Factory)->withServiceAccount($credentialsFilePath);
        $messaging = $factory->createMessaging();

        $message = CloudMessage::fromArray([
            'notification' => [
                'title' => $header,
                'body' => $content
            ],
            'topic' => 'general'
        ]);

        $messaging->send($message);

    }

    public function index()
    {
        $notification = Notification::get();
        return view('notification.list', ['notification' => $notification]);
    }

    public function create(Notification $notification)
    {
        return view('notification.add', [
            'notification' => $notification
        ]);
    }

    public function store(Request $request)
    {
        $notification = new Notification();
        $header = $request->get('header');
        $message = $request->get('message');
        $notification->header = $header;
        $notification->message = $message;

        try {
            if ($notification->save()) {
                $this->firebaseApi($header, $message);
                return back()->with('success', 'Added Successfully');
            }
            return back()->with('error', 'Not Added');
        } catch (Exception $ex) {

            return back()->with('error', $ex);
        }
    }


    public function show(Notification $notification)
    {
        return view('notification.single')->with('notification', $notification);
    }

    public function edit(Notification $notification)
    {
        return view('notification.edit', [
            'notification' => $notification
        ]);
    }

    public function update(Request $request, Notification $notification)
    {
        try {
            $notification->update([
                $notification->header = $request->get('header'),
                $notification->message = $request->get('message'),
            ]);

            return back()->with('success', 'Updated Successfully');
        } catch (Exception $ex) {
            return back()->with('error', 'Not Updated');
        }
    }

    public function destroy(Notification $notification)
    {
        try {
            $notification->delete();
            return back()->with('success', 'Deleted Successfully');
        } catch (Exception $ex) {
            return redirect()->back()->with('error', 'Not Deleted ');
        }
    }

    public function apiGet(Request $request)
    {
        $notification = Notification::get();
        return $notification;

    }

    public function apiCreate(Request $request)
    {
        $notification = new Notification();
        $notification->header = $request->get('header');
        $notification->message = $request->get('message');
        return $notification->save();

    }
}
