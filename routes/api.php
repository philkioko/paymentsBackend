<?php

Route::post('login', 'AuthenticationController@login');
Route::post('register', 'AuthenticationController@RegisterUser');
Route::post('/AddItem', 'ItemsController@AddItems');
Route::post('/ProcessPayments', 'ItemsController@PaymentProcessing');

 Route::group(['middleware' => 'jwt.auth'], function () {
    Route::get('AllCustomers', 'AuthenticationController@getAllCustomers');
    Route::get('RequestPurchasedItems/{id}', 'ItemsController@GetPurchasedItems');
    Route::post('DeletePurchasedItem', 'ItemsController@DeleteItemsPurchased');
    Route::post('QueryDailyReport', 'ReportsController@QueryDailyreport');
    Route::post('QueryWeeklyReport', 'ReportsController@QueryWeeklyReports');
    Route::post('QueryMonthlyReport', 'ReportsController@QueryMonthlyReports');
 });

