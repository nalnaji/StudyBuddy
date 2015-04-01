class LocationController < ApplicationController
	private
		def location_params
			params.require(:location).permit(:name, { :course_ids => [] }, :lat, :long, :description)
		end
end
