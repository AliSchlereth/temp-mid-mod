class LinksController < ApplicationController

  def index
    if current_user
      @link = Link.new
      render :index
    else
      redirect_to login_path
    end
  end

end
