class BugsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @bug = @project.bugs.build(bug_params)
    authorize @bug

    if @bug.save
      redirect_to @project, notice: 'Bug was successfully created.'
    else
      render :new
    end
  end

  # Other controller actions...
end
