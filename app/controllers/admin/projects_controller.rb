class Admin::ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_project, :only => [:show, :edit, :update]

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
  end

  def destroy
  end

  def update
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def permitted_params
      params.require(:project).permit(:title, :description)
    end
    
end
