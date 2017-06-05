class Api::V1::LinksController < ApplicationController

  def create
    link = current_user.links.new(link_params)
    if link.save
      render partial: 'links/show-link', locals: {link: link}
    elsif link.title == ""
      render status: 412
    else
      render status: 400
    end
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    # params.permit(:read)
    params.require(:link).permit(:url, :title, :user_id, :read)
  end
end
