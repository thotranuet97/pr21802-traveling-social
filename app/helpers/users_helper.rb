module UsersHelper
  include Pagy::Frontend

  def current_user? user
    user == current_user
  end
end
