class MicroPostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @micro_post = current_user.micro_posts.new micropost_params
    respond_to do |format|
      if @micro_post.save
        format.html do
          redirect_to user_path(current_user), success: t(".success")
        end
      else
        format.html do
          flash[:danger] = @micro_post.errors.full_messages
          redirect_back fallback_location: root_path
        end
      end
    end
  end

  def update
    @micro_post = current_user.micro_posts.find_by id: params[:id]
    if @micro_post.update_attributes micropost_params
      respond_to do |format|
        format.html do
          redirect_to user_path(current_user), success: t(".success")
        end
        format.js
      end
    end
  end
  
  def destroy
    @micro_post = current_user.micro_posts.find_by id: params[:id]
    @micro_post.destroy
    respond_to do |format|
      format.html do
        redirect_to user_path(current_user), danger: t(".success")
      end
      format.js
    end
  end

  private
  
  def micropost_params
    params.require(:micro_post).permit :location_id, :content, :image,
      :image_cache
  end
end
