class OverviewsController < ApplicationController
  before_action :set_user

  def index
    @overviews = @user.overviews
    render json: @overviews
  end

  def show
    @overview = @user.overviews.find(params[:id])
    render json: @overview
  end

  def new
    @overview = @user.overviews.build
  end

  def create
    @overview = @user.overviews.build(overview_params)
    if @overview.save
      redirect_to user_overview_path(@user, @overview)
    else
      render 'new'
    end
  end

  def edit
    @overview = @user.overviews.find(params[:id])
  end

  def update
    @overview = @user.overviews.find(params[:id])
    if @overview.update(overview_params)
      redirect_to user_overview_path(@user, @overview)
    else
      render 'edit'
    end
  end

  def destroy
    @overview = @user.overviews.find(params[:id])
    @overview.destroy
    redirect_to user_overviews_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def overview_params
    params.require(:overview).permit(:title, :summary)
  end
end
