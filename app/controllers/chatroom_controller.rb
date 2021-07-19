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
  def index

  end
  def new
    @message = Message.new
  end
def create
  @message = Message.new(messages_params)
  @message.save
  @message = Message.new(content: params[:content],user_id: current_user.id)
   
  end
  def show
    @room = Room.find(params[:id])
    @user = current_user
    @messages = Message.all
        
    @message = Message.find_by(id: params[:id])
    @user = User.find_by(id: current_user.id)

    @relation = Relation.new
    @relation.userid = @user.id 
    @relation.roomid = @room.id
    @relation.save
    if @relation.save
      flash[:notice] = "#{@room.title}に参加しました"
    else
      flash[:alert] = "#{@room.title}には既に参加しています!"
    end
  end
  private
  def set_user
    @message.user_id = current_user.id
  end
end

