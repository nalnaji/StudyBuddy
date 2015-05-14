class ChatsController < ApplicationController
  respond_to :json
  
  def index
    respond_with Chat.all
  end

  def get_by_course_and_location
    respond_with Chat.find_or_create_by(:course_id => params[:course_id],
                                        :location_id => params[:location_id]).as_json
  end

  def show
    respond_with Chat.find(params[:id])
  end

  def create
    respond_with Chat.create(chat_params)
  end

  def update
    respond_with Chat.update(params[:id], chat_params)
  end

  def destroy
    respond_with Chat.destroy(params[:id])
  end

	private
	
		def chat_params
      params.require(:chat).permit(:course, :location, :message_ids => [], :user_ids => [])
		end
end
