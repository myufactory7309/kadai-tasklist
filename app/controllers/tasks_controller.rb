class TasksController < ApplicationController
  before_action :set_task, only:[:show, :edit, :update, :destory]
  
  #タスク全部を代入するから名前も複数になっている!?
  def index
    @tasks = Task.all 
  end 
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'タスクが正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクが投稿されませんでした'
      render :new
    end
    
  end
  
  def new
    @task = Task.new
  end
  
  def edit
    set_task
  end 
  
  #１個のタスクを代入するから名前も単数になっている!?
  def show
    set_task
  end 
  
  def update
    set_task

    if @task.update(task_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end 
  
  def destroy
    set_task
    @task.destroy

    flash[:success] = 'タスクは正常に削除されました'
    redirect_to tasks_url
  end 
  
  private

  # Strong Parameter
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end

  
end

  