class ProjectsController < ApplicationController

  def index
    @projects = current_user.projects

    if policy(current_user).manager?
      render 'index.html.erb'
    else

    end
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


  private

  def project_params
    params.require(:project).permit(:name)
  end
end
