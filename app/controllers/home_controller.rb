class HomeController < ApplicationController
  def index
    @courses = Course.all
    @locations = []
  end
  def get_buildings_for_course
    @locations = Locations.find_by_course_id(params[:course_id])
  end
end
