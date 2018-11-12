class ImagesController < ApplicationController
  before_action :set_user, only: :index

  def index
    @pagy, @images = pagy_array @user.images.order_created_desc, 
      items: Settings.images.per_page
  end

  def destroy
    @image = current_user.images.find_by id: params[:id]
    @image.destroy
    respond_to do |format|
      format.html do
        redirect_to user_images_path(current_user)
      end
      format.js
    end
  end

  private

  def set_user
    @user = User.find_by id: params[:user_id]
  end
end
