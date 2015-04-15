class HomeController < ApplicationController
  def index
    @courses = Course.all
    @locations = []
  end
  def get_buildings_for_course
    @course = Course.find(params[:course_id])
    @locations = Location.all
    render 'get_buildings.js'
  end
end
