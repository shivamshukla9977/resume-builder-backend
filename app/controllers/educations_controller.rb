class EducationsController < ApplicationController
  before_action :set_user

  def index
    @educations = @user.educations
  end

  def show
    @education = @user.educations.find(params[:id])
  end

  def new
    @education = @user.educations.build
  end

  def create
    @education = @user.educations.build(education_params)
    if @education.save
      redirect_to user_education_path(@user, @education)
    else
      render 'new'
    end
  end

  def edit
    @education = @user.educations.find(params[:id])
  end

  def update
    @education = @user.educations.find(params[:id])
    if @education.update(education_params)
      redirect_to user_education_path(@user, @education)
    else
      render 'edit'
    end
  end

  def destroy
    @education = @user.educations.find(params[:id])
    @education.destroy
    redirect_to user_educations_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def education_params
    params.require(:education).permit(:title, :organisation, :start_year, :finish_year)
  end
end
