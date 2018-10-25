class LocationsController < ApplicationController
  def index
    @locations = Location.includes :city
    @locations = @locations.search_location params[:s] if params[:s].present?
  end
end
