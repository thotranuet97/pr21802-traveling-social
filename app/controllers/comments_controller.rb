class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params.merge(user: current_user)
    respond_to do |format|
      if @comment.save
        format.html do
          flash[:success] = t(".success")
          redirect_back fallback_location: root_path
        end
        format.js
      else
        format.html do
          flash[:danger] = @comment.errors.full_messages
          redirect_back fallback_location: root_path
        end
      end
    end
  end

  def update
    @comment = current_user.comments.find_by id: params[:id]
    if @comment.update_attributes comment_params
      respond_to do |format|
        format.html do
          flash[:success] = t(".update")
          redirect_back fallback_location: root_path
        end
        format.js
      end
    end
  end

  def destroy
    @comment = current_user.comments.find_by id: params[:id]
    @comment.destroy
    respond_to do |format|
      format.html do
        flash[:danger] = t(".delete")
        redirect_back fallback_location: root_path
      end
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Review.friendly.find(params[:review_id]) if params[:review_id]
    @commentable = MicroPost.find_by_id(params[:micro_post_id]) if params[:micro_post_id]
  end
end
