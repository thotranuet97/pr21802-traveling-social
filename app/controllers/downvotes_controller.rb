class DownvotesController < ApplicationController
  before_action :find_status, only: [:create, :destroy]
  def create
    @micro_post.disliked_by current_user
    respond_to do |format|
      format.html { redirect_to user_path(current_user), success: t(".dislike") }
      format.js
    end
  end

  def destroy
    @micro_post.undisliked_by current_user
    respond_to do |format|
      format.html { redirect_to user_path(current_user), success: t(".undislike") }
      format.js
    end
  end

  private

  def find_status
    @micro_post = MicroPost.find_by id: params[:micro_post_id]
  end
end
