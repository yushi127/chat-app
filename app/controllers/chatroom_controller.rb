# class ChatroomController < ApplicationController

#   def index
#   end
  
  
#   def show
#     # @room = Room.find(params[:id])
#     # @user = User.find_by(id: current_user.id)
#     # @messages = Message.where()
#     # @message = Message.new
#   end

#   def create
#     @room = Room.find(params[:room_id])
#     @message = Message.new(message_params)
#     @message.user_id = current_user.id 
#     @message.room_id = @room.id
#     @message.save
#     redirect_to root_path
#   end
#   private
#     def message_params
#       params.require(:message).permit(:content)
#       # params.require(:messages).permit(:content, :user_id,:room_id)
#     end
# end

