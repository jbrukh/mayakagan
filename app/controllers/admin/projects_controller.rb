class Admin::ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_project, :only => [:show, :edit, :update, :destroy, :move]
  layout 'admin'

  def index
    @projects = Project.ordered
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

      if params[:images]
        params[:images].each do |image|
          @project.project_details.create!(image: image)
        end
      end

      redirect_to edit_admin_project_path(@project), alert: 'Successfully created.'
    else
      redirect_to edit_admin_project_path(@project), alert: 'Could not save this project.'
    end
  end

  def destroy
    @project.destroy
    redirect_to admin_projects_path
  end

  def update
    if @project.update(permitted_params)

      if params[:images]
        params[:images].each do |image|
          @project.project_details.create!(image: image)
        end
      end

      redirect_to edit_admin_project_path(@project), alert: 'Successfully updated.'
    else
      redirect_to edit_admin_project_path(@project), alert: 'Could not update this project.'
    end
  end

  def move
    puts "MOVING!", query_params[:move]
      if query_params[:move] == 'up'
        puts "MOVING HIGHER"
        @project.move_higher
      elsif query_params[:move] == 'down'
        puts "MOVING LOWER"
        @project.move_lower
      end
      redirect_to admin_projects_path
  end

  private

  def set_project
    @project = Project.friendly.find(params[:id])
  end

  def permitted_params
    params.require(:project).permit(:title, :description, :thumbnail, :hero, :shadow, :bottom_padding, :images => [])
  end

  def query_params
    params.permit(:move)
  end
end
