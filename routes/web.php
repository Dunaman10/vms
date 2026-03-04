<?php

use Illuminate\Support\Facades\Route;

Route::redirect('/', '/auth/login');
Route::redirect('/auth', '/auth/login')->name('login');
