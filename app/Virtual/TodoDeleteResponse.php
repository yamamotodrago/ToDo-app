<?php

/**
 * @OA\Schema(
 *     type="object",
 *     title="TODO事項の削除",
 *     description="TODO事項を削除する",
 * )
 */
class TodoDeleteResponse
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
     *     example="TODOを削除しました。",
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
}
