class Admin::ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_project, :only => [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(permitted_params)
    if @project.save
      redirect_to admin_project_path(@project)
    else
      redirect_to admin_project_path(@project), alert: 'Could not save this project.'
    end
  end

  def destroy
    @project.destroy
    redirect_to admin_projects_path
  end

  def update
    if @project.update(permitted_params)
      redirect_to admin_project_path(@project)
    else
      redirect_to admin_project_path(@project), alert: 'Could not update this project.'
    end
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def permitted_params
      params.require(:project).permit(:title, :description)
    end

end
