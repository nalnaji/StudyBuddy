class FindController < ApplicationController
	def index
		@courses = Course.all
	end
	def show
		@course = Course.find(params[:course_id])
		@locations = @course.locations
	end
	def chat
		@course = Course.find(params[:course_id])
		@location = Location.find(params[:location_id])
	end
end

