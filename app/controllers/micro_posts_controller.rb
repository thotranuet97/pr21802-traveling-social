class MicroPostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @micro_post = current_user.micro_posts.new micropost_params
    respond_to do |format|
      if @micro_post.save
        format.html do
          redirect_to user_path(current_user), success: t(".success")
        end
        format.js
      end
    end
  end

  private
  
  def micropost_params
    params.require(:micro_post).permit :location_id, :content
  end
end
