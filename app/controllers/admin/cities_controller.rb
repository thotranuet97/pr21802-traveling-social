class Admin::CitiesController < AdminController
  def new
    @city = City.new
  end

  def create
    @city = current_user.cities.new cities_params
    if @city.save
      flash[:info] = t ".city_created"
      redirect_to admin_cites_path
    else
      flash[:alert] = t ".cities_created_error"
      render :new
    end
  end
end
