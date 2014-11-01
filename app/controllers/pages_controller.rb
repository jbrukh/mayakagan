class PagesController < ApplicationController
  
  def home
    @projects = Project.all
  end


  def show
    @project = Project.find(params[:id])
  end

end
