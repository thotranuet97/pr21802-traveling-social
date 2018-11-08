class ReviewsController < ApplicationController
  before_action :set_location, only: [:create, :new]
  before_action :set_review, except: [:create, :new, :index]
  def new
    @review = @location.reviews.build
  end

  def create
    @review = current_user.reviews.new review_params
    @review.location = @location
    if @review.save
      flash[:info] = t ".review_created"
      redirect_to location_review_path(@location, @review)
    else
      flash[:alert] = t ".review_created_error"
      render :new
    end
  end

  def index
    if params[:location_id].present?
      @location = Location.friendly.find params[:location_id]
      @pagy, @reviews = pagy_array @location.reviews, 
        items: Settings.reviews.per_page
    else
      @pagy, @reviews = pagy_array current_user.reviews, 
        items: Settings.reviews.per_page
    end
  end

  def show
    @location = Location.friendly.find params[:location_id]
    @review.punch request
  end

  def edit
  end
  
  def update
    if @review.update_attributes review_params
      redirect_to location_review_path(@review.location, @review),
        notice: t(".review_updated")
    else
      render :edit
    end
  end
  
  def destroy
    @review.destroy
    redirect_to root_path, notice: t(".review_deleted")
  end
  
  private
  def set_review
    @review = Review.friendly.find params[:id]
  end

  def set_location
    @location = Location.friendly.find params[:location_id]
  end

  def review_params
    params.require(:review).permit :name, :content, :thumbnail,
      images_attributes: [:id, :image, :image_cache, :_destroy]
  end
end
