class ProjectsController < ApplicationController
  before_action :set_user

  def index
    @projects = @user.projects
    render json: @projects
  end

  def show
    @project = @user.projects.find(params[:id])
    render json: @project
  end

  def new
    @project = @user.projects.build
  end

  def create
    @project = @user.projects.build(project_params)
    if @project.save
      redirect_to user_project_path(@user, @project)
    else
      render 'new'
    end
  end

  def edit
    @project = @user.projects.find(params[:id])
  end

  def update
    @project = @user.projects.find(params[:id])
    if @project.update(project_params)
      redirect_to user_project_path(@user, @project)
    else
      render 'edit'
    end
  end

  def destroy
    @project = @user.projects.find(params[:id])
    @project.destroy
    redirect_to user_projects_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :duration)
  end
end
