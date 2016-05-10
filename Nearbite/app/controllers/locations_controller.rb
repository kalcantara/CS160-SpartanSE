class LocationsController < ApplicationController

  def index
    @locations = Location.find(params[:id])
  end

  def show
    @locations = Location.all
  end
end
