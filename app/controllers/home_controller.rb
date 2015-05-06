class HomeController < ApplicationController
  def index
#    @courses = Course.all.sort_by(&:number_of_students).reverse.take(20)
#    @locations = []
#    @chat = nil
#    respond_to do |format|
#      format.html { render 'index' }
#      format.json { render json: @courses }
#    end
  end
  def get_buildings_for_course
    @course = Course.find(params[:course_id])
    @locations = Location.all.sort_by do |location|
      location.number_of_students_in_course(@course.id)    
    end.reverse
    respond_to do |format|
      format.js { render 'get_buildings.js' }
      format.json { render json: @locations.to_json(:course_id => @course.id) }
    end
  end
  def get_chatroom
    @course = Course.find(params[:course_id])
    @location = Location.find(params[:location_id])
    @chat = Chat.find_or_create_by(:course_id => @course.id, :location_id => @location.id)
    render 'get_chatroom.js'
  end
end
