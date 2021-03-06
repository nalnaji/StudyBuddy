class CoursesController < ApplicationController
  respond_to :json
  
  def index
    respond_with Course.search('')
  end

  def show
    respond_with Course.find(params[:id])
  end

  def create
    respond_with Course.create(course_params)
  end

  def update
    respond_with Course.update(params[:id], course_params)
  end

  def destroy
    respond_with Course.destroy(params[:id])
  end

  def search
    respond_with Course.search(params[:query])
  end
	private
	
		def course_params
			params.require(:course).permit(:name, { :location_ids => [] })
		end
end
