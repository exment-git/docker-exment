<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Laravel\Passport\Http\Controllers\AuthorizationController;
use Illuminate\Contracts\Auth\StatefulGuard;

class AppServiceProvider extends ServiceProvider
{
    public function register()
    {
        $this->app->when(AuthorizationController::class)
            ->needs(StatefulGuard::class)
            ->give(function () {
                return app('auth.driver');
            });
    }

    public function boot()
    {
        //
    }
}
