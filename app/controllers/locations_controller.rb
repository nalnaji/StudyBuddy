class LocationsController < ApplicationController
  respond_to :json

  def index
    respond_with Location.all
  end

  def show
    respond_with Location.find(params[:id])
  end

  def create
    respond_with Location.create(location_params)
  end

  def update
    respond_with Location.update(params[:id], location_params)
  end

  def destroy
    respond_with Location.destroy(params[:id])
  end

	private
  def location_params
    params.require(:location).permit(:name, { :course_ids => [] }, :lat, :long, :description)
  end
end
