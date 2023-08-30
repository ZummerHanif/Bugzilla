class BugsController < ApplicationController
  before_action :set_project, only: [:index, :new, :create]
  before_action :set_bug, only: [:show, :edit, :update, :destroy]
  before_action :authorize_qa, only: [:new, :create,:update_status]

  def index
    @bugs = Bug.includes(:creator).where(project_id: @project.id)
  end

  def show
    @bug = Bug.find(params[:id])
  end

  def new
    @bug = @project.bugs.build(creator: current_user)
  end

  def create
    @bug = @project.bugs.build(bug_params)
    @bug.creator = current_user


    if @bug.save
      redirect_to project_bugs_path(@project), notice: 'Bug was successfully created.'
    else
      render :new
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @bug = @project.bugs.find(params[:id])

    if current_user.developer?
      new_status = params[:bug][:status]

      if new_status == 'resolved' || new_status == 'completed'
        if @bug.update(status: new_status)
          redirect_to project_bugs_path(@project), notice: 'Bug status updated successfully.'
        else
          redirect_to project_bugs_path(@project), alert: 'Bug status could not be updated.'
        end
      else
        redirect_to project_bugs_path(@project), alert: 'Invalid status update. Please enter "resolved" or "completed".'
      end
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
