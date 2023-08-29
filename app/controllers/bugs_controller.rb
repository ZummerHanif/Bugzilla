class BugsController < ApplicationController
  before_action :set_project, only: [:index, :new, :create]
  before_action :set_bug, only: [:show, :edit, :update, :destroy]

  def index
    @bugs = @project.bugs.includes(:project)
  end

  def new
    @bug = @project.bugs.build
  end

  def create
    @bug = @project.bugs.build(bug_params)

    if @bug.save
      redirect_to project_bugs_path(@project), notice: 'Bug was successfully created.'
    else
      render :new
    end
  end

  # Other actions: show, edit, update, destroy

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_bug
    @bug = Bug.find(params[:id])
  end

  def bug_params
    params.require(:bug).permit(:title, :status,:bug_type, :deadline, :description, :screenshot, :project_id)
  end
end
