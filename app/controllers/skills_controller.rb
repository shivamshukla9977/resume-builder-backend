class SkillsController < ApplicationController
  before_action :set_user

  def index
    @skills = @user.skills
    render json: @skills
  end

  def show
    @skill = @user.skills.find(params[:id])
    render json: @skill
  end

  def new
    @skill = @user.skills.build
  end

  def create
    @skill = @user.skills.build(skill_params)
    if @skill.save
      redirect_to user_skill_path(@user, @skill)
    else
      render 'new'
    end
  end

  def edit
    @skill = @user.skills.find(params[:id])
  end

  def update
    @skill = @user.skills.find(params[:id])
    if @skill.update(skill_params)
      redirect_to user_skill_path(@user, @skill)
    else
      render 'edit'
    end
  end

  def destroy
    @skill = @user.skills.find(params[:id])
    @skill.destroy
    redirect_to user_skills_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def skill_params
    params.require(:skill).permit(:title)
  end
end
