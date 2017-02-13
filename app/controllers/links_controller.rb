class LinksController < ApplicationController

  def index
    if current_user
      @link = Link.new
      render :index
    else
      redirect_to login_path
    end
  end

  def create
    link = current_user.links.new(link_params)
    if link.save
      flash[:success] = "#{link.url} saved as #{link.title}"
    else
      flash[:danger] = link.errors.full_messages[0]
    end
    redirect_to links_path
  end

  private
    def link_params
      params.require(:link).permit(:title, :url)
    end

end
