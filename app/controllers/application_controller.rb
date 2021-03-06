class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def home
    @projects = Project.ordered.where(:published => true)
  end

  def about
  end

  def album
  end

end
