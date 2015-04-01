class CourseController < ApplicationController
	private
	
		def course_params
			params.require(:course).permit(:name, { :location_ids => [] })
		end
end
