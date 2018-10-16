class Admin::LocationsController < AdminController
  before_action :find_location, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @location = Location.new
  end

  def create
    @location = current_user.locations.new location_params
    if @location.save
      flash[:notice] = t '.success'
      redirect_to new_admin_location_path
    else
      flash[:alert] = t '.error'
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update_attributes location_params
      flash[:alert] = t '.success'
      redirect_to edit_admin_location_path
    else
      flash[:alert] = t '.error'
      render :edit
    end
  end

  private

  def location_params
    params.require(:location).permit :name, :description, :longitude,
      :latitude, :city_id, :position
  end

  def find_location
    @location = Location.find_by id: params[:id]
  end
end
