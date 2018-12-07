class TasksController < ApplicationController
  before_action :require_user_logged_in, only:[:index, :new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :set_task, only:[:show, :edit, :update, :destory]

  
  #タスク全部を代入するから名前も複数になっている!?
  def index
    # @task = current_user.tasks.build  # form_for 用
    @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
  end 
  
  def new
    @task = Task.new
  end
  
  #１個のタスクを代入するから名前も単数になっている!?
  def show
    @task = Task.find(params[:id])
  end 
  

  
  def create
    #@task = Task.new(task_params)
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'タスクが正常に投稿されました'
      #redirect_to @task
      redirect_to root_url

    else
      flash.now[:danger] = 'タスクが投稿されませんでした'
      render :new
    end
  end
  

  def edit
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
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  
end

  