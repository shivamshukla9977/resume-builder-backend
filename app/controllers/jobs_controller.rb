class JobsController < ApplicationController
  before_action :set_user

  def index
    @jobs = @user.jobs
    render json: @jobs
  end

  def show
    @job = @user.jobs.find(params[:id])
    render json: job
  end

  def new
    @job = @user.jobs.build
  end

  def create
    @job = @user.jobs.build(job_params)
    if @job.save
      redirect_to user_job_path(@user, @job)
    else
      render 'new'
    end
  end

  def edit
    @job = @user.jobs.find(params[:id])
  end

  def update
    @job = @user.jobs.find(params[:id])
    if @job.update(job_params)
      redirect_to user_job_path(@user, @job)
    else
      render 'edit'
    end
  end

  def destroy
    @job = @user.jobs.find(params[:id])
    @job.destroy
    redirect_to user_jobs_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def job_params
    params.require(:job).permit(:title, :company_name, :start_from, :leave_on, :type)
  end
end
