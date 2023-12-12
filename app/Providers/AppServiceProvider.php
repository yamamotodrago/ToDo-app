<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\URL;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        \API::error(function (\Illuminate\Validation\ValidationException $exception) {
            $data = $exception->validator->getMessageBag();
            $msg = collect($data)->first();
            if (is_array($msg)) {
                $msg = $msg[0];
            }
            return response()->json(
                [
                    'success' => 0,
                    'message' => $msg,
                    'status_code' => 400,
                    // 'errors' => $data,
                ],
                200
            );
        });
        \API::error(function (\Dingo\Api\Exception\ValidationHttpException $exception) {
            $errors = $exception->getErrors();
            return response()->json(
                [
                    'success' => 0,
                    'message' => $errors->first(),
                    'status_code' => 400,
                    // 'errors' => $errors,
                ],
                200
            );
        });
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);

        if ((bool) env('APP_FORCE_HTTPS', false)) {
            URL::forceScheme("https");
        }
    }
}
