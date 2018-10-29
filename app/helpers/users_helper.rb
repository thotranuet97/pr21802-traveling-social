module UsersHelper
  include Pagy::Frontend

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to(root_url) unless current_user? @user
  end

  def current_user? user
    user == current_user
  end
end
