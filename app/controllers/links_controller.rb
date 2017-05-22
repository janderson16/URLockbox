class LinksController < ApplicationController
  before_action :require_permission, only: [:edit]

  def index
    unless current_user
      redirect_to "/login"
    else
      @user = current_user
      @links = @user.links.all
    end
  end

  def create
    user = current_user
    link = user.links.new(link_params)

    if link.save
      render partial: 'links/show-link', locals: {link: link}, layout: false
    else
      flash[:notice] = "Invalid URL!"
      render :new, status: 500
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:success] = "Link successfully updated"
      redirect_to links_path
    elsif @link.title == ""
      flash[:notice] = "Title cannot be blank"
      render :edit
    else
      flash[:notice] = "Please check that URL is a valid address"
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title, :user_id)
  end
end
