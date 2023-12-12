<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class Todo extends Model
{
    use HasFactory, SoftDeletes, SerializeDate;

    protected $dates    = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $hidden = [
        // 'created_at',
        // 'updated_at',
        // 'deleted_at',
    ];

    protected $fillable = [
        'title',
        'description',
        'due_date',
        'is_completed',
    ];
}
