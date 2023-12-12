<?php

namespace Database\Seeders;

use App\Models\Todo;
use Illuminate\Database\Seeder;

class TodoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i = 0; $i < 100; $i++) {
            Todo::create([
                'title' => "クローズド テスト",
                'description' => 'クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。',
                'due_date' => date('Y-m-d', strtotime('+' . mt_rand(3, 30) . ' day')),
                'is_completed' => ($i % mt_rand(3, 4) == 0 ? true : false),
            ]);
        }
    }
}
