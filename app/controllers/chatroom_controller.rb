class ChatroomController < ApplicationController
  

  # def new
  #   @message=Message.new(content:params[:content],user_id:@current_user.id)
  #   @message = Message.new(messages_params)
  #   @message.user_id = current_user.id
  #   if @message.save
  #     redirect_to @message
  #   else
  #     render new
  #   end
  # end
 
  def new
    @message = Message.new
  end
def create
  @message = Message.new(messages_params)
  @message.save
  @message = Message.new(content: params[:content],user_id: current_user.id)
   
  end
  def show
    @messages = Message.all
    
 @message = Message.find_by(id: params[:id])
 @user = User.find_by(id: current_user.id)

  end
  private
  def set_user
    @message.user_id = current_user.id
  end
end

