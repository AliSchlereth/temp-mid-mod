class Api::V1::LinksController < ApplicationController

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private
    def true?(obj)
      obj.to_s == "true"
    end

    def link_params
      params.permit(:read)
    end
end
