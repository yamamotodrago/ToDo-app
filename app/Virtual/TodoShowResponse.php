<?php

/**
 * @OA\Schema(
 *     type="object",
 *     title="TODO事項の表示",
 *     description="TODO事項を表示する",
 * )
 */
class TodoShowResponse
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
     *     example="TODOを表示しました。",
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
     *      title="データ",
     *      description="TODO詳細情報",
     *      type="object",
     *      @OA\Property(property="id", example="1", type="int"),
     *      @OA\Property(property="title", example="アプリクローズドテスト", type="string"),
     *      @OA\Property(property="description", example="テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。", type="string"),
     *      @OA\Property(property="due_date", example="2022-08-25", type="string", description="TODO事項の締め切り日（日付フォーマット2022-09-25）"),
     *      @OA\Property(property="is_completed", example=0, type="int", description="TODO事項の状態は完了しましたか（0は未完成、1は完了済み）"),
     *      @OA\Property(property="created_at", example="2022-08-21 21:13:45", type="string"),
     *      @OA\Property(property="updated_at", example="2022-08-21 21:13:45", type="string"),
     *      @OA\Property(property="deleted_at", example=null, type="string"),
     * )
     *
    //  * @var array
     */
    public $data;
}
