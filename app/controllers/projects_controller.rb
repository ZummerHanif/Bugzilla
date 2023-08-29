class ProjectsController < ApplicationController
  def index
    @projects = Project.all

    if policy(current_user).manager?
      render 'index.html.erb'
    else
      # Add code here for handling non-manager users
    end
  end
end
