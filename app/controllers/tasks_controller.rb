class TasksController < ApplicationController
  before_action :set_task, only: %i[ show update destroy ]

  # GET /tasks
  def user_tasks
    return render json: { error: 'User id is missing' }, status: :bad_request unless params[:user_id]
    
    if params[:status]
      @tasks = Task.where(user_id: params[:user_id], status: params[:status])
      return render json: @tasks
    end
    @tasks = Task.where(user_id: params[:user_id])
    
    render json: @tasks
  end

  def subtask 
    @parent_task = Task.find(params[:task_id])
    @subtask = @parent_task.subtask.build(sub_task_params)

    if @subtask.save
      render json: @subtask, status: :created
    else
      render json: @subtask.errors, status: :unprocessable_entity
    end
  end

  # GET /tasks/1
  def show
    @task = Task.find(params[:id])
    render json: @task 
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_update_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task = Task.find(params[:id])
    @comments = Comment.where(task_id:params[:id])
    @comments.destroy
    @task.destroy
  
    if @task.destroyed?
      render json: { message: 'Tarefa removida.' }, status: :ok
    else
      render json: { message: 'Falha ao remover a tarefa.' }, status: :unprocessable_entity
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:user_id, :title, :description, :status, :expire_date, :category, :parent_id)
    end

    # Only allow a list of parameters updateds.
    def task_update_params
      params.require(:task).permit(:status)
    end

    def subtask_update_params
      params.require(:subtask).permit(:check)
    end


    # Only allow a list of parameters updateds.
    def sub_task_params
      params.require(:task).permit(:description)
    end
end
