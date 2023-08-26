class ProjectsController < ApplicationController
  def index
    @projects = Project.all

    if policy(current_user).manager?
      render 'index.html.erb'
    else

    end
  end
end
