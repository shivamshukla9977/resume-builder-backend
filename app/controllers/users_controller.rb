class UsersController < ApplicationController
  def index
    if params[:search]
      search_query = "%#{params[:search]}%"
      @users = User.where(
        "first_name LIKE :search OR last_name LIKE :search OR email LIKE :search OR city LIKE :search OR state LIKE :search OR country LIKE :search",
        search: search_query
      ).includes(:educations, :skills, :links, :projects, :overviews, :jobs)
    else
      @users = User.all.includes(:educations, :skills, :links, :projects, :overviews, :jobs)
    end
    render json: @users
  end

  def show
    @user = User.includes(:educations, :skills, :links, :projects, :overviews, :jobs).find(params[:id])

   render json: @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :middle_name, :last_name, :email, :city, :state, :country, :search)
  end
end
