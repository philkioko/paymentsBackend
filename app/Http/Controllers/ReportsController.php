<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\models\Item;
use App\models\Payment;

class ReportsController extends Controller
{
    //generate daily reports
    public function QueryDailyreport(Request $request)
    {
        $items = [];
        foreach (Payment::where('date_created', '=', $request->todaysdate)->get() as $payment) {
            $items[] = Item::where('payment_id', '=', $payment->id)->get();
        }

        return response($items[0]);
    }

    //generate weekly reports by choosing date range from start date to end date
    public function QueryWeeklyReports(Request $request)
    {
        $from = $request->startdate;
        $to = $request->enddate;

        $WeeklyReport = Item::whereBetween('date_created', [$from, $to])->get();

        return response($WeeklyReport);
    }

    //getting records for the month
    public function QueryMonthlyReports(Request $request)
    {
        // here am just simulating records for the current month, not using user values
        $currentMonth = date('m');
        $currentYear = date('Y');

        $Monthly = Item::whereYear('created_at', '=', $currentYear)
              ->whereMonth('created_at', '=', $currentMonth)
              ->get();

        return response($Monthly);
    }
}
