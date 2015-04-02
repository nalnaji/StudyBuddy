class ChatController < ApplicationController
	def chat_params
		params.require(:chat).permit(:course, :location, {:message_ids => []})
	end
end
