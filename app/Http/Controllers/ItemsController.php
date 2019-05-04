<?php

namespace App\Http\Controllers;

use App\models\Item;
use App\models\Payment;
use Illuminate\Http\Request;
use Exception;

class ItemsController extends Controller
{
    // creating payments for selected items
    public function PaymentProcessing(Request $request)
    {
        $CreatePayments = new Payment();
        $CreatePayments->customer_id = $request->userCredentials['userId'];
        $CreatePayments->customer_name = $request->userCredentials['fullnames'];
        $CreatePayments->amount_paid = $request->amount;
        $CreatePayments->items_totals = $request->totals;
        $CreatePayments->date_created = date('Y-m-d');
        try {
            $CreatePayments->save();
            $this->CreatePurchasedItems($CreatePayments->id, $request->items, $request->userCredentials['fullnames']);

            return response(200); // response code for success
        } catch (Exception $e) {
            return response(402); // response code for exception error
        }
    }

    // add purchased items in the database
    public function CreatePurchasedItems($paymentId, $items, $custname)
    {
        foreach ($items as $item) {
            $PurchasedItems = new Item();
            $PurchasedItems->payment_id = $paymentId;
            $PurchasedItems->itemname = $item['itemname'];
            $PurchasedItems->items_image = $item['itemimage'];
            $PurchasedItems->items_price = $item['price'];
            $PurchasedItems->date_created = date('Y-m-d');
            $PurchasedItems->customer_name = $custname;
            $PurchasedItems->save();
        }
    }

    // return purchased items
    public function GetPurchasedItems($id)
    {
        $payments = Payment::where('customer_id', '=', $id)->get();
        try {
            if (count($payments) < 1) {
                return response(403); // no record found in the system
            } else {
                $items = [];
                foreach ($payments as $payment) {
                    $items[] = (Item::where('payment_id', '=', $payment->id)->get());
                }

                $Customeritems = $items[0];

                return response(compact('Customeritems', 'payments'));
            }
        } catch (Exception $e) {
            return response(402); /// response code for exception error
        }
    }

    //deleting purchased items
    public function DeleteItemsPurchased(Request $request)
    {
        $deleteItems = Payment::where('customer_id', '=', $request->id)->first();

        try {
            foreach (Item::where('payment_id', '=', $deleteItems->id)->get() as $Item) {
                $deleteItems = Item::find($Item->id);
                $deleteItems->delete();
            }
            try {
                $deletePaymentRecord = Payment::where('customer_id', '=', $request->id)->delete();

                return response(200);
            } catch (Exception $e) {
                return response(402); // response code for exception error
            }
        } catch (Exception $e) {
            return response(402); // response code for exception error
        }
    }
}
