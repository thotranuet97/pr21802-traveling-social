class Admin::LocationsController < AdminController
  before_action :find_location, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @pagy, @locations = pagy Location.includes(:city), items: Settings.admin.locations.index.per_page
  end

  def new
    @location = Location.new
  end

  def create
    @location = current_user.locations.new location_params
    if @location.save
      flash[:success] = t ".success"
      redirect_to edit_admin_location_path @location
    else
      flash[:danger] = t ".error"
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update_attributes location_params
      flash[:success] = t ".success"
      redirect_to edit_admin_location_path @location
    else
      flash[:danger] = t ".error"
      render :edit
    end
  end

  def destroy
    @location.destroy
    flash[:success] = t ".success"
    redirect_to admin_locations_path
  end

  private

  def location_params
    params.require(:location).permit :name, :description, :longitude,
      :latitude, :city_id, :thumbnail, :thumbnail_cache,
      images_attributes: [:id, :image, :image_cache, :_destroy]
  end

  def find_location
    @location = Location.friendly.find params[:id]
  end
end
