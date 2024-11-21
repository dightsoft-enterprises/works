<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\GeneralSettings;
use App\Models\Subscriber;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use PHPMailer\PHPMailer\PHPMailer;

class ApiSubscriberController extends Controller
{

    public function testEmail()
    {
        $subscriber = Subscriber::where('id', 1)->first();
        $settings = $this->getSettings();
        $mail = new PHPMailer(true);
        try {

            $mail->SMTPDebug = 1;
            $mail->isSMTP();
            $mail->Host = $settings->smtpServer;
            $mail->SMTPAuth = true;
            $mail->Username = $settings->smtpUsername;
            $mail->Password = $settings->smtpPassword;
            $mail->SMTPSecure = $settings->smtpSecurity;
            $mail->Port = $settings->smtpPort;

            $mail->setFrom($settings->smtpEmail, $settings->name);
            $mail->addAddress('jameshen2019@gmail.com');
            $mail->isHTML(true);
            $mail->Subject = 'VERIFICATION CODE';

            $mail->Body = 'CODE: ' . $subscriber->code;

            if (!$mail->send()) {
              return print_r($mail->ErrorInfo);
            } else {
                return print_r("Email has been sent.");
            }

        } catch (Exception $e) {
            return print_r($e);
        }
    }
    private function getCurrency(): array
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


    public function auth(Request $request)
    {

        $email = $request->get('email');
        $password = $request->get('password');
        $subscriber = Subscriber::where('email', $email)
            ->where('password', $password)->first();
        if ($subscriber != null) {
            return $subscriber;
        }
//        $request->authenticate();
//
//
//        if (Auth::check()) {
//            $user = Auth::user();
//            $token = $user->createToken(env('APP_API_KEY'))->plainTextToken;
//            return $subscriber;
//        }

        return null;

    }

    public function view(Request $request)
    {
        $id = $request->get('id');
        $subscriber = Subscriber::where('id', $id)->first();
        return $subscriber;
    }

    public function withdrawal(Request $request)
    {
        $ipAddress = $request->get('ipAddress');
        $crypto = $request->get('crypto');
        $cryptoAmount = $request->get('cryptoAmount');


        $id = $request->get('id');
        $subscriber = Subscriber::where('id', $id)->first();
        if ($subscriber->id != null) {
            $subscriber->update([
                $subscriber->bitcoin = $request->get('bitcoin'),
                $subscriber->ethereum = $request->get('ethereum'),
                $subscriber->litecoin = $request->get('litecoin'),
                $subscriber->tron = $request->get('tron'),
                $subscriber->binance = $request->get('binance'),
                $subscriber->tether = $request->get('tether'),

            ]);

            $message = "User $subscriber->email has initiated a withdrawal request of $cryptoAmount ($crypto) from IP address $ipAddress";
            $generalSettings = $this->getSettings();
            $this->sendWithdrawalEmail($generalSettings, $subscriber->email, $message);
            return $subscriber;
        }
        return null;
    }


    public function updateBalance(Request $request)
    {
        $id = $request->get('id');
        $subscriber = Subscriber::where('id', $id)->first();
        if ($subscriber->id != null) {
            $subscriber->update([
                $subscriber->timeSpent = $request->get('timeSpent'),
                $subscriber->bitcoin =  ($subscriber->bitcoin + $request->get('bitcoin')),
                $subscriber->ethereum = ($subscriber->ethereum + $request->get('ethereum')),
                $subscriber->litecoin = ($subscriber->litecoin + $request->get('litecoin')),
                $subscriber->tron =  ($subscriber->tron + $request->get('tron')),
                $subscriber->binance = ($subscriber->binance + $request->get('binance')),
                $subscriber->tether = ($subscriber->tether + $request->get('tether')),

            ]);

            return $subscriber;
        }
        return null;
    }

    private function sendWithdrawalEmail($settings, $email, $message)
    {
        $mail = new PHPMailer(true);
        try {

            $mail->SMTPDebug = 0;
            $mail->isSMTP();
            $mail->Host = $settings->smtpServer;
            $mail->SMTPAuth = true;
            $mail->Username = $settings->smtpUsername;
            $mail->Password = $settings->smtpPassword;
            $mail->SMTPSecure = $settings->smtpSecurity;
            $mail->Port = $settings->smtpPort;

            $mail->setFrom($settings->smtpEmail, $settings->name);
            $mail->addAddress($email);
            $mail->isHTML(true);
            $mail->Subject = 'WITHDRAWAL REQUEST';

            $mail->Body = $message;

            if (!$mail->send()) {
                Log::error($mail->ErrorInfo);
            } else {
                Log::error("Email has been sent.");
            }

        } catch (Exception $e) {
            Log::error('Message could not be sent.');
        }
    }

    private function sendVerificationEmail($settings, $subscriber)
    {
        $mail = new PHPMailer(true);
        try {

            $mail->SMTPDebug = 0;
            $mail->isSMTP();
            $mail->Host = $settings->smtpServer;
            $mail->SMTPAuth = true;
            $mail->Username = $settings->smtpUsername;
            $mail->Password = $settings->smtpPassword;
            $mail->SMTPSecure = $settings->smtpSecurity;
            $mail->Port = $settings->smtpPort;

            $mail->setFrom($settings->smtpEmail, $settings->name);
            $mail->addAddress($subscriber->email);
            $mail->isHTML(true);
            $mail->Subject = 'VERIFICATION CODE';

            $mail->Body = 'CODE: ' . $subscriber->code;

            if (!$mail->send()) {
                Log::error($mail->ErrorInfo);
            } else {
                Log::error("Email has been sent.");
            }

        } catch (Exception $e) {
            Log::error('Message could not be sent.');
        }
    }

    public function getSettings()
    {
        return GeneralSettings::where('id', 1)->first();
    }

    public function verifyAccount(Request $request)
    {
        $id = $request->get('id');
        $subscriber = Subscriber::where('id', $id)->first();
        if ($subscriber->id != null) {
            $subscriber->update([
                $subscriber->approved = 1,
            ]);
            return $subscriber;
        }
        return null;
    }

    public function reSendVerificationCode(Request $request)
    {
        $generalSettings = $this->getSettings();

        $id = $request->get('id');
        $subscriber = Subscriber::where('id', $id)->first();
        if ($subscriber->id != null) {
            $subscriber->update([
                'code' => fake()->randomNumber(5)
            ]);

            $this->sendVerificationEmail($generalSettings, $subscriber);

            return json_encode([
                'success' => true,
                'message' => 'SUCCESS',
                'code' => 200,
                'data' => $subscriber

            ]);
        }

        return json_encode([
            'message' => 'FAILED',
            'success' => false,
            'code' => '401',
            'errors' => ''
        ]);
    }


    public function create(Request $request)
    {
        $generalSettings = $this->getSettings();

        $email = $request->get('email');
        $check = Subscriber::where('email', $email)->first();

        if ($check && $check->id != null) {
            if ($check->approved == 0) {
                $this->sendVerificationEmail($generalSettings, $check);
                return json_encode([
                    'success' => true,
                    'message' => 'VERIFY',
                    'code' => 200,
                    'data' => $check

                ]);
            } else {
                return json_encode([
                    'message' => 'EMAIL-USED',
                    'success' => false,
                    'code' => '401',
                    'errors' => ''


                ]);
            }
        } else {
            $response = [];
            $subscriber = Subscriber::create([
                'firstName' => $request->get('firstName'),
                'lastName' => $request->get('lastName'),
                'phone' => $request->get('phone'),
                'email' => $request->get('email'),

                'approved' => $generalSettings->emailVerification ? 0 : 1,
                'useDefault' => 1,
                'status' => 1,
                'password' => $request->get('password'),
                'code' => fake()->randomNumber(6) . "",

                'bitcoin' => 0.00,
                'ethereum' => 0.00,
                'litecoin' => 0.00,
                'tron' => 0.00,
                'binance' => 0.00,
                'tether' => 0.00,
                'currency' => '["BTC"]',
                'timeSpent' => 0,


                'bitcoinRate' => $generalSettings->bitcoinRate,
                'ethereumRate' => $generalSettings->ethereumRate,
                'litecoinRate' => $generalSettings->litecoinRate,
                'tronRate' => $generalSettings->tronRate,
                'binanceRate' => $generalSettings->binanceRate,
                'tetherRate' => $generalSettings->tetherRate,

                'bitcoinLimit' => $generalSettings->bitcoinLimit,
                'ethereumLimit' => $generalSettings->ethereumLimit,
                'litecoinLimit' => $generalSettings->litecoinLimit,
                'tronLimit' => $generalSettings->tronLimit,
                'binanceLimit' => $generalSettings->binanceLimit,
                'tetherLimit' => $generalSettings->tetherLimit,

                'timeout' => $generalSettings->timeout,
                'withdrawalMessage' => $generalSettings->withdrawalMessage,
                'timeoutMessage' => $generalSettings->timeoutMessage,
                'gender' => $request->get('gender')
            ]);

            if (!$subscriber) {
                $response = json_encode([
                    'message' => 'FAILED',
                    'success' => false,
                    'code' => '401',
                    'errors' => '',
                    'data' => null

                ]);
            } else {
                $this->sendVerificationEmail($generalSettings, $subscriber);
                $response = json_encode([
                    'success' => true,
                    'message' => 'SUCCESS',
                    'code' => 200,
                    'data' => $subscriber

                ]);
            }

            return $response;
        }


    }


}
