<?php

use App\Models\Todo;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(Tests\TestCase::class, RefreshDatabase::class);

it('登録したTODO一覧で表示をテストします', function () {
    $response = $this->postJson('/api/todos', []);
    $response->assertStatus(200);
});

it('TODOの新規登録をテストします', function () {
    $attributes = Todo::factory()->raw();
    $response = $this->postJson('/api/todos', $attributes);
    $response->assertStatus(201)->assertJson([
        'success' => 1,
        'message' => 'TODOを登録しました。'
    ]);
    $todo_result = $response->original['data'];
    $attributes = ['id' => $todo_result['id']] + $attributes;
    $attributes['deleted_at'] = null;
    $this->assertDatabaseHas('todos', $attributes);
});

it('登録したTODOの表示をテストします', function () {
    $todo = Todo::factory()->create();

    $response = $this->getJson("/api/todos/{$todo->id}");

    $data = [
        'success' => 1,
        'message' => 'TODOを表示しました。',
        'data' => [
            'id' => $todo->id,
            'title' => $todo->title,
            'description' => $todo->description,
            'due_date' => $todo->due_date,
            "is_completed" => 0,
            "created_at" => date('Y-m-d H:i:s'),
            "updated_at" => date('Y-m-d H:i:s'),
            "deleted_at" => null
        ]
    ];

    $response->assertStatus(200)->assertJson($data);
});

it('登録したTODOの変更をテストします', function () {
    $todo = Todo::factory()->create();
    $updatedTodo = ['title' => 'JWTを追加「テスト」', 'due_date' => date('Y-m-d', strtotime('+7 days'))];
    $response = $this->putJson("/api/todos/{$todo->id}", $updatedTodo);
    $response->assertStatus(200)->assertJson([
        'success' => 1,
        'message' => 'TODOを変更しました。'
    ]);
    $this->assertDatabaseHas('todos', $updatedTodo);
});

it('登録したTODOの完了をテストします', function () {
    $todo = Todo::factory()->create();
    $response = $this->putJson("/api/todos/{$todo->id}/complete");
    $response->assertStatus(200)->assertJson([
        'success' => 1,
        'message' => 'TODOを完了しました。'
    ]);
});

it('登録したTODOの削除をテストします', function () {
    $todo = Todo::factory()->create();
    $response = $this->deleteJson("/api/todos/{$todo->id}");
    $response->assertStatus(410)->assertJson([
        'success' => 1,
        'message' => 'TODOを削除しました。'
    ]);
    $this->assertCount(0, Todo::all());
});
