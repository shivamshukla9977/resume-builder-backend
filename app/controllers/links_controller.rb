class LinksController < ApplicationController
  before_action :set_user

  def index
    @links = @user.links
  end

  def show
    @link = @user.links.find(params[:id])
  end

  def new
    @link = @user.links.build
  end

  def create
    @link = @user.links.build(link_params)
    if @link.save
      redirect_to user_link_path(@user, @link)
    else
      render 'new'
    end
  end

  def edit
    @link = @user.links.find(params[:id])
  end

  def update
    @link = @user.links.find(params[:id])
    if @link.update(link_params)
      redirect_to user_link_path(@user, @link)
    else
      render 'edit'
    end
  end

  def destroy
    @link = @user.links.find(params[:id])
    @link.destroy
    redirect_to user_links_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def link_params
    params.require(:link).permit(:title, :link)
  end
end
