class LocationsController < ApplicationController
  def index
    if params[:city_id].present?
      @city = City.friendly.find params[:city_id]
      @pagy, @locations = pagy_array @city.locations, 
        items: Settings.locations.per_page
    else
      @pagy, @locations = pagy Location.includes(:city), 
        items: Settings.locations.per_page
      @locations = @locations.search_location params[:s] if params[:s].present?
    end
  end
  def show
    @location = Location.friendly.find params[:id]
    @location.punch request
  end
end
