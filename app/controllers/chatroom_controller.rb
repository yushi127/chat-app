class ChatroomController < ApplicationController

  def index
    @message = Message.new
  end
  
  def new
    @message = Message.new
  end
  

  def show
    @room = Room.find(params[:id])
    @user = User.find_by(id: current_user.id)
    @messages = Message.all
    # @message = Message.where(user_id: @user.id).first
    @message = Message.new
  end

  def create
    @message = Message.new(messages_params)
    byebug
    @message.save
  end
  private
    def message_params
    params.require(:messages).permit(:content, :user_id,:room_id)
  end
end

