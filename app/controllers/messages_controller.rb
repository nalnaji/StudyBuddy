class MessagesController < ApplicationController
	def index
		@messages = Message.all
	end
	
	def create
		@message = Message.create!(message_params)
		@chat = Chat.find(@message.chat_id)
		render 'chat/create'
	end
	def message_params
		params.require(:message).permit(:content, :user_id, :chat_id)
	end
end
