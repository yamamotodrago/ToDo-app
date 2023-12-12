<?php

/**
 * @OA\Schema(
 *     type="object",
 *     title="TODO事項の一覧",
 *     description="TODO事項を一覧で表示する",
 * )
 */
class TodoListResponse
{
    /**
     * @OA\Property(
     *     title="成功？",
     *     description="1は成功、0はエラーが発生",
     *     type="int",
     *     example=1,
     * )
     *
     * @var int
     */
    public $success;

    /**
     * @OA\Property(
     *     title="メッセージ",
     *     description="サーバーからメッセージ",
     *     type="string",
     *     example="TODOを一覧で表示しました。",
     * )
     *
     * @var int
     */
    public $message;

    /**
     * @OA\Property(
     *     title="SUCCESS",
     *     description="状態コード",
     *     type="int",
     *     example=200,
     * )
     *
     * @var int
     */
    public $status_code;

    /**
     * @OA\Property(
     *     title="データ",
     *     description="TODOを一覧データ",
     *      property="data",
     *      type="object",
     *      @OA\Property(property="current_page", example="1", type="int"),
     *      @OA\Property(
     *          type="array",
     *          @OA\Items(
     *              type="object",
     *              {
     *                  @OA\Property(property="id", example="1", type="int"),
     *                  @OA\Property(property="title", example="アプリクローズドテスト", type="string"),
     *                  @OA\Property(property="description", example="テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。", type="string"),
     *                  @OA\Property(property="due_date", example="2022-08-25", type="string", description="TODO事項の締め切り日（日付フォーマット2022-09-25）"),
     *                  @OA\Property(property="is_completed", example=0, type="int", description="TODO事項の状態は完了しましたか（0は未完成、1は完了済み）"),
     *                  @OA\Property(property="created_at", example="2022-08-21 21:13:45", type="string"),
     *                  @OA\Property(property="updated_at", example="2022-08-21 21:13:45", type="string"),
     *                  @OA\Property(property="deleted_at", example=null, type="string"),
     *              },
     *          ),
     *      ),
     *      @OA\Property(property="first_page_url", example="http://127.0.0.1:8000/api/todos?page=1", type="string"),
     *      @OA\Property(property="from", example="1", type="int"),
     *      @OA\Property(property="next_page_url", example="http://127.0.0.1:8000/api/todos?page=2", type="string"),
     *      @OA\Property(property="path", example="http://127.0.0.1:8000/api/todos", type="string"),
     *      @OA\Property(property="per_page", example="10", type="int"),
     *      @OA\Property(property="prev_page_url", example=null, type="string"),
     *      @OA\Property(property="to", example="10", type="int"),
     * )
     *
    //  * @var string
     */
    public $data;
}
