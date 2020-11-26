class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @project = Project.find(params[:project_id])
    @task.project = @project
    if @task.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:project_id])
  end

  def update
    @task.user = current_user
    respond_to do |format|
      if @task.update(task_params)
        redirect_to project_tasks_path(@task, @project_id)
      else
        render :edit
      end
    end
  end

  def destroy
    @task.destroy
    redirect_to projects_path

  private

  def set_task
    @task = Task.fin(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :date_start, :date_end)
  end
end

