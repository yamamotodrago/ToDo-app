<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreTodoRequest extends FormRequest
{
    /**
     * Indicates whether validation should stop after the first rule failure.
     *
     * @var bool
     */
    protected $stopOnFirstFailure = true;

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'title'  => 'required|min:3',
            'due_date' => 'required|date|after_or_equal:' . date('Y-m-d'),
        ];
    }
}
