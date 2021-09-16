class MessagesController < ApplicationController


  def create
    @room = Room.find(params[:room_id])
    @user = current_user
    message = @room.messages.new(message_params)
    # message.user_id = @user.id 
    # message.room_id = @room.id

    if message.save
      redirect_to  room_path(@room)
    else
      redirect_to  room_path(@room)
    end
  end
  private
    def message_params
      params.require(:message).permit(:content,:user_id)
      # params.require(:messages).permit(:content, :user_id,:room_id)
    end
end