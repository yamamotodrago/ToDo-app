<?php

namespace App\Admin\Controllers;

use App\Models\Todo;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class TodoController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'TODOリスト';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Todo());
        $grid->model()->orderBy('created_at', 'desc')->orderBy('id', 'desc');
        $grid->paginate(10);

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();

            $filter->like('title', 'タイトル');
            $filter->date('due_date', '締め切り日');
            $filter->in('is_completed', '完了済み？')->checkbox([
                1    => '完了済み',
                0    => '未完成',
            ]);

            $filter->scope('trashed', 'ごみ箱')->onlyTrashed();
        });


        $grid->column('id', __('Id'))->sortable()->totalRow('合计');
        $grid->column('title', __('タイトル'));
        $grid->column('description', __('内容'))->limit(30);
        $grid->column('due_date', __('締め切り日'))->sortable()->editable('date');
        $grid->column('is_completed', __('完了済み？'))->sortable()->using([1 => '完了済み', 0 => '未完成'])->dot([
            1 => 'success',
            0 => 'info',
        ]);
        $grid->column('created_at', __('登録日時'))->datetime('Y-m-d H:i:s');
        $grid->column('updated_at', __('変更日時'))->date('Y-m-d');
        $grid->column('deleted_at', __('削除日時'))->date('Y-m-d');

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Todo::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('title', __('タイトル'));
        $show->field('description', __('内容'));
        $show->field('due_date', __('締め切り日'));
        $show->field('is_completed', __('完了済み？'));
        $show->field('created_at', __('登録日時'));
        $show->field('updated_at', __('変更日時'));
        $show->field('deleted_at', __('削除日時'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Todo());

        $form->text('title', __('タイトル'))->required();
        $form->textarea('description', __('内容'));
        $form->date('due_date', __('締め切り日'))->default(date('Y-m-d', strtotime('+7 day')));
        $form->switch('is_completed', __('完了済み？'));

        return $form;
    }
}
