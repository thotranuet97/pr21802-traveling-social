class PageController < ApplicationController
  def index
    @list_following = User.list_following current_user
    @micro_post = MicroPost.new
    @pagy, @micro_posts = pagy_array MicroPost.all_status(current_user), 
      items: Settings.micro_posts.per_page
    @user = current_user
    return unless params[:id_status]
    @micro_post = MicroPost.find_by id: params[:id_status]
    respond_to do |format|
      format.html
      format.js
    end
  end
end
