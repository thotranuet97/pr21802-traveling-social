class CitiesController < ApplicationController
  def index
    @pagy, @cities = pagy_array City.includes(:locations), 
      items: Settings.cities.per_page
  end
end
