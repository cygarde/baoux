class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]

  def index
    @statut = ["En cours", "En attente", "Realisé"]
    if (params[:statut].present?)
      @projects = Project.search_by_statut(params[:statut])
    else
      @projects = Project.all
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
  end

  def update
    @chantier.user = current_user
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def projecrt_params
    params.require(:project).permit(:name, :description, :category, :status)
  end
end
