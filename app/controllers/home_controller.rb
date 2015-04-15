class HomeController < ApplicationController
  def index
    @courses = Course.all
    @locations = []
    @chat = nil
  end
  def get_buildings_for_course
    @course = Course.find(params[:course_id])
    @locations = Location.all
    render 'get_buildings.js'
  end
  def get_chatroom
    @course = Course.find(params[:course_id])
    @location = Location.find(params[:location_id])
    @chat = Chat.find_or_create_by(:course_id => @course.id, :location_id => @location.id)
    render 'get_chatroom.js'
  end
end
