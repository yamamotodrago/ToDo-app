<?php

use App\Http\Controllers\API\TodoController;
use Dingo\Api\Routing\Router;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//DingoAPIに基づいてLaravelでAPI
$api = app('Dingo\Api\Routing\Router');


/**
 * php artisan api:routes
 * +------+-----------+-------------------------+----------------+--------------------------------------------------+-----------+------------+----------+------------+
 * | Host | Method    | URI                     | Name           | Action                                           | Protected | Version(s) | Scope(s) | Rate Limit |
 * +------+-----------+-------------------------+----------------+--------------------------------------------------+-----------+------------+----------+------------+
 * |      | GET|HEAD  | api/todos               | todos.index    | App\Http\Controllers\API\TodoController@index    | No        | v1         |          |            |
 * |      | POST      | api/todos               | todos.store    | App\Http\Controllers\API\TodoController@store    | No        | v1         |          | 1.67 req/s |
 * |      | GET|HEAD  | api/todos/{todo}        | todos.show     | App\Http\Controllers\API\TodoController@show     | No        | v1         |          |            |
 * |      | PUT|PATCH | api/todos/{todo}        | todos.update   | App\Http\Controllers\API\TodoController@update   | No        | v1         |          |            |
 * |      | DELETE    | api/todos/{todo}        | todos.destroy  | App\Http\Controllers\API\TodoController@destroy  | No        | v1         |          |            |
 * |      | PUT       | api/todos/{id}/complete | todos.complete | App\Http\Controllers\API\TodoController@complete | No        | v1         |          | 1.67 req/s |
 * +------+-----------+-------------------------+----------------+--------------------------------------------------+-----------+------------+----------+------------+
 */

$api->version('v1', function ($api) {
    $api->resource('todos', TodoController::class);
    $api->put('todos/{id}/complete', ['as' => 'todos.complete', 'uses' => 'App\Http\Controllers\API\TodoController@complete']);

    //指定したレート制限キーが1分間に許可した最大試行100回数を超えたかを判断できます。
    $api->group(['middleware' => 'api.throttle', 'limit' => 100, 'expires' => 1], function (Router $api) {
        $api->post('todos', ['as' => 'todos.store', 'uses' => 'App\Http\Controllers\API\TodoController@store']);
    });
});
