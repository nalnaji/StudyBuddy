class FindController < ApplicationController
	def index
		@courses = Course.search(params[:search])
	end
	def show
		@course = Course.find(params[:course_id])
		@locations = Location.search(params[:search])
	end
	def chat
		@course = Course.find(params[:course_id])
		@location = Location.find(params[:location_id])
		@chat = Chat.find_or_create_by(:course_id => @course.id, :location_id => @location.id)
		@messages = @chat.messages
		render 'chat/chat'
	end
end

