<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class TodoFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            "title" => "クローズド テスト",
            "description" => "クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。",
            "due_date" => date('Y-m-d', strtotime('+7 days')),
            "is_completed" => 0,
            "created_at" => date('Y-m-d H:i:s'),
            "updated_at" => date('Y-m-d H:i:s'),
        ];
    }
}
