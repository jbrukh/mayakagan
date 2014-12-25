class Admin::ImagesController < ApplicationController

  before_action :set_image


  def destroy
    @image.destroy
    redirect_to edit_admin_project_detail_path(id: @image.project_detail_id)
  end

  def update
    if params[:move] == 'up'
      @image.move_higher
    elsif params[:move] == 'down'
      @image.move_lower
    end

    redirect_to edit_admin_project_detail_path(id: @image.project_detail_id)
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end


end