<?php

namespace App\Http\Controllers\API;

use Dingo\Api\Routing\Helpers;

/**
 * @OA\Info(
 *     title="TODOリスト",
 *     description="LaravelでのAPI仕様",
 *     version="1.0.0",
 *     @OA\Contact(
 *         email="colycao.work@gmail.com"
 *     ),
 *     @OA\License(
 *         name="Apache 2.0",
 *         url="http://www.apache.org/licenses/LICENSE-2.0.html"
 *     )
 * )
 * @OA\Tag(
 *     name="TODOリスト",
 *     description="やるべき作業を書き出したリストのこと",
 * )
 * @OA\Server(
 *     description="LaravelアプリケーションのAPIがSwagger/OpenAPIドキュメント",
 *     url=L5_SWAGGER_CONST_HOST
 * )
 * @OA\SecurityScheme(
 *     type="apiKey",
 *     in="header",
 *     name="X-APP-ID",
 *     securityScheme="X-APP-ID"
 * )
 */

class Controller extends \App\Http\Controllers\Controller
{
    use Helpers;
}
