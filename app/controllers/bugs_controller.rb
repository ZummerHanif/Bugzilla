class BugsController < ApplicationController
  before_action :set_project, only: [:index, :new, :create]
  before_action :set_bug, only: [:show, :edit, :update, :destroy]
  before_action :authorize_qa, only: [:new, :create]

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



  def assign
    @bug = Bug.find(params[:id])
    @project = @bug.project
    if  current_user.developer?
      @bug.update(assignee: current_user)
      redirect_to project_bugs_path( @project), notice: 'Bug assigned to you.'
    else
      redirect_to project_bugs_path( @project), alert: 'Bug could not be assigned.'
    end
  end



  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_bug
    @bug = Bug.find(params[:id])
  end

  def authorize_qa
    unless current_user.qa?
      redirect_to project_bugs_path(@project), alert: 'Only QA users can create bugs.'
    end
  end

  def bug_params
    params.require(:bug).permit(:title, :status,:bug_type, :deadline, :description, :screenshot, :project_id)
  end
end
