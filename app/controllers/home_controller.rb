class HomeController < ApplicationController
  def index
    @courses = Course.all.sort_by(&:number_of_students).reverse
    @locations = []
    @chat = nil
  end
  def get_buildings_for_course
    @course = Course.find(params[:course_id])
    @locations = Location.all.sort_by do |location|
      location.number_of_students_in_course(@course.id)    
    end.reverse
    render 'get_buildings.js'
  end
  def get_chatroom
    @course = Course.find(params[:course_id])
    @location = Location.find(params[:location_id])
    @chat = Chat.find_or_create_by(:course_id => @course.id, :location_id => @location.id)
    render 'get_chatroom.js'
  end
end
