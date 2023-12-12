<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\StoreTodoRequest;
use App\Http\Requests\UpdateTodoRequest;
use App\Http\Requests\CompleteTodoRequest;
use App\Http\Transformers\TodoTransformer;
use App\Models\Todo;
use Illuminate\Http\Response;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class TodoController extends Controller
{
    /**
     * @OA\Get(
     *     path="/todos",
     *     operationId="todoAll",
     *     tags={"TODO"},
     *     summary="登録されているTODOを一覧で表示する",
     *     security={
     *       {"api_key": {}},
     *     },
     *     @OA\Parameter(
     *         name="page",
     *         in="query",
     *         description="ペジネーション中に何番目ページ",
     *         required=false,
     *         example="1",
     *         @OA\Schema(
     *             type="integer",
     *         )
     *     ),
     *     @OA\Response(
     *         response="200",
     *         description="一覧で表示済み",
     *         @OA\JsonContent(ref="#/components/schemas/TodoListResponse")
     *     ),
     * )
     *
     * Display a listing of the resource.
     */
    public function index()
    {
        $model = Todo::orderBy('created_at', 'desc')->orderBy('id', 'desc')->simplePaginate(10);
        $data = [
            'success' => 1,
            'message' => 'TODOを一覧で表示しました。',
            'status_code' => 200,
            'data' => $model,
        ];

        return $this->response->array($data);
    }

    /**
     * @OA\Post(
     *     path="/todos",
     *     operationId="todoCreate",
     *     tags={"TODO"},
     *     summary="TODO（やること）を登録する",
     *     security={
     *       {"api_key": {}},
     *     },
     *     @OA\Response(
     *         response="201",
     *         description="登録済み",
     *         @OA\JsonContent(ref="#/components/schemas/TodoShowResponse")
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(ref="#/components/schemas/TodoStoreRequest")
     *     ),
     * )
     * Store a newly created resource in storage.
     *
     * @param \App\Http\Requests\StoreTodoRequest $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(StoreTodoRequest $request)
    {
        $model = new Todo();
        $model->fill($request->all());
        $model->save();

        $model = Todo::query()->findOrFail($model->id);
        $data = [
            'success' => 1,
            'message' => 'TODOを登録しました。',
            'status_code' => 200,
            'data' => $model,
        ];

        return $this->response->array($data)->statusCode(201);
    }

    /**
     * @OA\Get(
     *     path="/todos/{id}",
     *     operationId="todoGet",
     *     tags={"TODO"},
     *     summary="登録したTODOを表示する",
     *     security={
     *       {"api_key": {}},
     *     },
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="指定されたIDに基づいてTODOを表示する",
     *         required=true,
     *         example="1",
     *         @OA\Schema(
     *             type="integer",
     *         ),
     *     ),
     *     @OA\Response(
     *         response="200",
     *         description="表示済み",
     *         @OA\JsonContent(ref="#/components/schemas/TodoShowResponse")
     *     ),
     * )
     *
     * Display a listing of the resource.
     *
     * @param int $id
     *
     */
    public function show($id)
    {
        try {
            $model = Todo::query()->findOrFail($id);
        } catch (ModelNotFoundException $e) {
            return $this->response->error('TODO情報が見つかりませんでした。', 404);
        }

        $data = [
            'success' => 1,
            'message' => 'TODOを表示しました。',
            'status_code' => 200,
            'data' => $model,
        ];

        return $this->response->array($data)->statusCode(200);
    }

    /**
     * @OA\Put(
     *     path="/todos/{id}",
     *     operationId="todoUpdate",
     *     tags={"TODO"},
     *     summary="登録したTODOを変更する",
     *     security={
     *       {"api_key": {}},
     *     },
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="指定されたIDに基づいてTODOを変更する",
     *         required=true,
     *         example="1",
     *         @OA\Schema(
     *             type="integer",
     *         ),
     *     ),
     *     @OA\Response(
     *         response="200",
     *         description="変更済み",
     *         @OA\JsonContent(ref="#/components/schemas/TodoShowResponse")
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(ref="#/components/schemas/TodoStoreRequest")
     *     ),
     * )
     *
     * Update the specified resource in storage.
     *
     * @param \App\Http\Requests\UpdateTodoRequest $request
     * @param int                      $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(UpdateTodoRequest $request, $id)
    {
        $params = $request->all();
        try {
            $model = Todo::query()->findOrFail($id);
        } catch (ModelNotFoundException $e) {
            return $this->response->error('TODO情報が見つかりませんでした。', 404);
        }
        $model->fill($params);
        $model->save();

        $data = [
            'success' => 1,
            'message' => 'TODOを変更しました。',
            'status_code' => 200,
            'data' => $model,
        ];

        return $this->response->array($data)->statusCode(200);
    }

    /**
     * @OA\Put(
     *     path="/todos/{id}/complete",
     *     operationId="todoComplete",
     *     tags={"TODO"},
     *     summary="登録したTODOの完了状態をメモする",
     *     security={
     *       {"api_key": {}},
     *     },
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="指定されたIDに基づいてTODOの完了状態をメモする",
     *         required=true,
     *         example="1",
     *         @OA\Schema(
     *             type="integer",
     *         ),
     *     ),
     *     @OA\Response(
     *         response="200",
     *         description="完了済み",
     *         @OA\JsonContent(ref="#/components/schemas/TodoShowResponse")
     *     ),
     * )
     *
     * Update the specified resource in storage.
     *
     * @param \App\Http\Requests\CompleteTodoRequest $request
     * @param int                      $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function complete(CompleteTodoRequest $request, $id)
    {
        try {
            $model = Todo::query()->findOrFail($id);
        } catch (ModelNotFoundException $e) {
            return $this->response->error('TODO情報が見つかりませんでした。', 404);
        }
        if (1 == $model->is_completed) {
            return $this->response->error('TODOはリクエスト受け取った前に更新された。', 406);
        }

        $model->is_completed = 1;
        $model->save();

        $data = [
            'success' => 1,
            'message' => 'TODOを完了しました。',
            'status_code' => 200,
            'data' => $model,
        ];

        return $this->response->array($data)->statusCode(200);
    }

    /**
     * @OA\Delete(
     *     path="/todos/{id}",
     *     operationId="todoDelete",
     *     tags={"TODO"},
     *     summary="登録したTODOを削除する",
     *     security={
     *       {"api_key": {}},
     *     },
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="指定されたIDに基づいてTODOを削除する",
     *         required=true,
     *         example="1",
     *         @OA\Schema(
     *             type="integer",
     *         ),
     *     ),
     *     @OA\Response(
     *         response="410",
     *         description="削除済み",
     *         @OA\JsonContent(ref="#/components/schemas/TodoDeleteResponse")
     *     ),
     * )
     *
     * Remove the specified resource from storage.
     *
     * @param int $id
     *
     * @return \Illuminate\Http\Response
     * @throws \Exception
     */
    public function destroy($id): Response
    {
        try {
            $model = Todo::query()->findOrFail($id);
        } catch (ModelNotFoundException $e) {
            return $this->response->error('TODO情報が見つかりませんでした。', 404);
        }

        $model->delete();

        $data = [
            'success' => 1,
            'message' => 'TODOを削除しました。',
            'status_code' => 200,
        ];

        return $this->response->array($data)->statusCode(410);
    }
}
