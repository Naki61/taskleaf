class TasksController < ApplicationController
  def index
    @tasks = Task.all#ビューで利用したい全てのデータを取得して、ビューに伝えるためのインスタンス変数に格納
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}を更新しました。"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end

  def create
    @task = Task.new(task_params)#安全化されたtaskパラメータを取得
    #@=①前回操作したままの値をフォーム内に引き継いで表示できる。②検証エラーの内容をユーザーに対して表示できる。
    if @task.save #データベースに保存
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"#一覧画面に遷移させる（@taskがtasks_urlの場合)
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

end
