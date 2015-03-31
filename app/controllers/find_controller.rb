class FindController < ApplicationController
	def index
		@courses = Course.all
	end
	def show
	end
	def chat
	end
end

