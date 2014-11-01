class Admin::ProjectsController < ApplicationController

  before_action :authenticate_user!

  def index
    @projects = Project.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def destroy
  end

  def update
  end
end
