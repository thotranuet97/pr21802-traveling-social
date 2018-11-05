class UpvotesController < ApplicationController
  before_action :find_status, only: [:create, :destroy]
  def create
    @micro_post.liked_by current_user
    respond_to do |format|
      format.html { redirect_to user_path(current_user), success: t(".like") }
      format.js
    end
  end

  def destroy
    @micro_post.unliked_by current_user
    respond_to do |format|
      format.html { redirect_to user_path(current_user), success: t(".unlike") }
      format.js
    end
  end

  private

  def find_status
    @micro_post = MicroPost.find_by id: params[:micro_post_id]
  end
end
