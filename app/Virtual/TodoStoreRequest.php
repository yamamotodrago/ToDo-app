<?php

/**
 * @OA\Schema(
 *     type="object",
 *     title="TODO事項の登録",
 *     description="TODO事項を登録する",
 * )
 */
class TodoStoreRequest
{
    /**
     * @OA\Property(
     *     title="タイトル",
     *     description="TODO事項",
     *     example="アプリクローズドテスト",
     * )
     *
     * @var string
     */
    public $title;

    /**
     * @OA\Property(
     *     title="内容",
     *     description="TODO事項の具体的な内容",
     *     example="クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。",
     * )
     *
     * @var string
     */
    public $description;

    /**
     * @OA\Property(
     *     title="締め切り日",
     *     description="TODO事項の締め切り日（日付フォーマット2022-09-25）",
     *     format="date",
     *     example="2022-09-25",
     * )
     *
     * @var string
     */
    public $due_date;
}
