class Admin::CitiesController < AdminController
  before_action :find_city, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @pagy, @cities = pagy City.all,
      items: Settings.admin.cities.index.per_page
  end

  def new
    @city = City.new
  end

  def create
    @city = current_user.cities.new city_params
    if @city.save
      flash[:info] = t ".success"
      redirect_to admin_cities_path
    else
      flash[:alert] = t ".error"
      render :new
    end
  end

  def edit
  end

  def update
    if @city.update_attributes city_params
      flash[:success] = t ".success"
      redirect_to admin_cities_path
    else
      flash[:danger] = t ".error"
      render :edit
    end
  end

  def destroy
    @city.destroy
    flash[:success] = t ".success"
    redirect_to admin_cities_path
  end

  private
  def city_params
    params.require(:city).permit :name, :description, :longitude,
      :latitude, :thumbnail
  end

  def find_city
    @city = City.friendly.find params[:id]
  end
end
