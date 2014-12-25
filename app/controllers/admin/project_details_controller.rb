class Admin::ProjectDetailsController < ApplicationController

  before_action :set_project_detail, except: [:create]
  layout 'admin'

  def create
    @project = Project.friendly.find(params[:project_id])
    if @project.project_details.create(detail_type: 'flipbook')
      redirect_to edit_admin_project_path(@project), alert: "Added flipbook!"
    else
      redirect_to edit_admin_project_path(@project), alert: "Failed to add flipbook."
    end
  end

  def edit
  end

  def destroy
    @project_detail.destroy
    redirect_to edit_admin_project_path(id: @project_detail.project_id)
  end

  def update
    if params[:move] == 'up'
      @project_detail.move_higher
    elsif params[:move] == 'down'
      @project_detail.move_lower
    end

    if params[:images]
      params[:images].each do |image|
        @project_detail.images.create!(image: image)
      end
      redirect_to edit_admin_project_detail_path(@project_detail)
      return
    end

    redirect_to edit_admin_project_path(id: @project_detail.project_id)
  end

  private

  def set_project_detail
    @project_detail = ProjectDetail.find(params[:id])
  end

  def permitted_params
    params.permit(:move, :image_attributes => [:image], :images => [])
  end

end
