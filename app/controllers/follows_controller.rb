class FollowsController < ApplicationController
  def index
    @user = User.find_by id: params[:user_id]
    @pagy, @followers = pagy_array @user.followers, 
      items: Settings.users.follow.per_page
    @pagy, @followings = pagy_array @user.all_following, 
      items: Settings.users.follow.per_page
  end

  def create
    @user = User.find params[:user_id]
    current_user.follow @user
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @user = User.find params[:user_id]
    current_user.stop_following @user
    respond_to do |format|
      format.js
    end
  end
end
