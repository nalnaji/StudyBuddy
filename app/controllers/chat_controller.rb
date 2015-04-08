class ChatController < ApplicationController
	def index
		render 'chat/update_buddylist'
	end
	def buddy_poll
		@chat = Chat.find(params[:chat_id])
		@user = current_user
		@user.update(:chats_id => @chat.id, :last_visited_chat => @chat.id, :last_buddy_poll_time => Time.now.to_i)
		@chat.users << @user unless(@chat.users.include? @user)
		@participants = @chat.users
	  render 'chat/update_buddylist'
	end
	def remove_from_chat
		@chat = Chat.find(params[:chat_id])
		@user = current_user
		@chat.users.delete(@user)
		render nothing: true
	end
	private
	def chat_params
		params.require(:chat).permit(:course, :location, :message_ids => [], :user_ids => [])
	end
end
