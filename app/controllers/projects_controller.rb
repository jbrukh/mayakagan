class ProjectsController < ApplicationController

  def show
    @project = Project.friendly.find(params[:id])
    @next_project = @project.next || Project.ordered.first
    @prev_project = @project.prev || Project.ordered.last
  end

end
