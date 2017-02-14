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
      flash[:success] = "Saved New Link"
    else
      flash[:danger] = link.errors.full_messages[0]
    end
    redirect_to links_path
  end

  def edit
    if params[:id]
      @link = Link.find(params[:id])
    else
      @link = Link.new
    end
  end

  def update
    link = Link.find(params[:id])
    if link.update(link_params)
      flash[:success] = "Successfully update link"
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
