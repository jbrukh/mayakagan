class Admin::ProjectDetailsController < ApplicationController

  before_action :set_project_detail

  def destroy
    @project_detail.destroy
    redirect_to edit_admin_project_path(id: @project_detail.project_id)
  end

  private

  def set_project_detail
    @project_detail = ProjectDetail.find(params[:id])
  end

end
