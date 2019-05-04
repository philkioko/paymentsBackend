<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Exception;
use App\User;
use JWTAuth;
use Auth;
use App\models\Log;
use Carbon\Carbon;

class AuthenticationController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => 'required',
            'password' => 'required',
        ]);
        if ($validator->fails()) {
            return response(402);
        }

        $credentials = $request->only('username', 'password');
        try {
            if (!$token = JWTAuth::attempt($credentials)) {
                return response(401);
            }
        } catch (JWTException $e) {
            return response(404);
        }

        $credentials = [
            'username' => Auth::user()->username,
        ];

        $this->CreateLogs(Auth::user()->username); // create login logs
        return response(compact('credentials', 'token'));
    }

    //create logging time for logged in user
    public function CreateLogs($user)
    {
        $mytime = Carbon::now();

        $createLogs = new Log();
        $createLogs->username = $user;
        $createLogs->logging_time = $mytime->toDateTimeString();
        $createLogs->user_id = Auth::user()->id;
        $createLogs->save();
    }

    public function Logoutuser()
    {
        $getLogs = Log::where('user_id', '=', Auth::user()->id)->orderBy('id', 'desc')->first();
    }

    public function RegisterUser(Request $request)
    {
        $Validation = Validator::make($request->all(), [
             'fullnames' => 'required',
             'username' => 'required',
             'email' => 'required',
             'password' => 'required',
        ]);
        if ($Validation->fails()) {
            return response(422); // response code for validation
        } else {
            $userExists = User::where('email', '=', $request->email)->get();
            if (count($userExists) > 0) {
                return response(409); // response code for record existence in the system
            } else {
                $newUser = new User();
                $newUser->fullnames = $request->fullnames;
                $newUser->username = $request->username;
                $newUser->email = $request->email;
                $newUser->password = bcrypt($request->password);
                try {
                    $newUser->save();
                    $custdetails = [
                        'fullnames' => $newUser->fullnames,
                        'userId' => $newUser->id,
                    ];

                    $code = 200;

                    return response(compact('code', 'custdetails')); // response code for success
                } catch (Exception $e) {
                    return response(402); // response code for exception error
                }
            }
        }
    }

    // load all customers
    public function getAllCustomers()
    {
        $customers = User::where('status', '=', 0)->get();

        return $customers;
    }
}
