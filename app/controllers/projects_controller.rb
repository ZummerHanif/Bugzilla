class ProjectsController < ApplicationController
  #before:action authorize @project

  def index
    if current_user.qa?
      @projects = Project.all
      @assigned_projects=current_user.assigned_projects
    elsif current_user.developer?
      @projects = current_user.assigned_projects
    else
      @projects = current_user.projects
    end
  end

  def show
    @project = Project.find(params[:id])
    @users = User.all # For the add user dropdown
  end
  def new
     @project = Project.new
     authorize @project
  end


  def create


    @project = Project.new(project_params)
    @project.user = current_user


    if @project.save
      redirect_to projects_path, notice: 'Project created successfully.'
    else
      flash.now[:alert] = 'Failed to create the project.'
      render :new
    end
  end



  def edit
    @project = Project.find(params[:id])
    authorize @project

  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to projects_path, notice: 'Project updated successfully.'
    else
      flash.now[:alert] = 'Failed to update the project.'
      render :edit
    end
  end



  def destroy
    @project = Project.find(params[:id])
    authorize @project

    if @project.destroy
      redirect_to projects_path, notice: 'Project was successfully deleted.'
    else
      redirect_to projects_path, alert: 'Failed to delete the project.'
    end
  end


  def add_user
    @project = Project.find(params[:id])

    if params[:user_project][:user_id].blank?
      redirect_to @project, alert: 'Please select a user to add.'
      return
    end
    user = User.find(params[:user_project][:user_id])

    @project.assigned_users << user unless @project.assigned_users.include?(user)
    redirect_to @project, notice: 'User added to project.'
  end

  def remove_user
    @project = Project.find(params[:id])
    user = User.find(params[:user_id])


    @project.assigned_users.delete(user)
    redirect_to @project, notice: 'User removed from project.'
  end


  private

  def project_params
    params.require(:project).permit(:name)
  end
end
