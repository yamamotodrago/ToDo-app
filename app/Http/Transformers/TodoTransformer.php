<?php

namespace App\Http\Transformers;

use League\Fractal\TransformerAbstract;
use App\Models\Todo;

class TodoTransformer extends TransformerAbstract
{
    public function transform(Todo $todo): array
    {
        exit();
        return [
            'id' => $todo->id,
            'title' => $todo->title,
            'description' => $todo->description,
            'due_date' => $todo->due_date,
            'is_completed' => $todo->is_completed,
            'is_completed_text' => $todo->is_completed ? "完了済み" : "未完成",
            'created_at' => $todo->created_at->toDateTimeString(),
            'updated_at' => $todo->updated_at->toDateTimeString(),
            'deleted_at' => !empty($todo->deleted_at) ? $todo->deleted_at->toDateTimeString() : '',
        ];
    }
}
