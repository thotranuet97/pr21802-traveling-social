class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find_by id: params[:id]
    @micro_post = MicroPost.new
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".user_updated"
      redirect_to user_path
    else
      flash[:danger] = t ".user_updated_error"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :thumbnail, :first_name, :last_name, :phone,
      :birtday, :gender, :about, :cover
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to(root_url) unless current_user? @user
  end

  def current_user? user
    user == current_user
  end

end
