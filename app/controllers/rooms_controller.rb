class RoomsController < ApplicationController
  before_action :set_user

  def index
    @rooms = Room.all
    @relation = Relation.all
  end
  
  def search
    @rooms = Room.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  def show
    @room = Room.find(params[:id])
    @user = current_user


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

  # def myroom
  #   @user = current_user
  #   @myRelations = Relation.where(userid: @user.id)
  #     # //下でループさせるから@roomsをあらかじめ定義する
  #   @rooms = []
  #      # //@roomsのなかにcurrent_userが入ってるルームを追加する
  #   @myRelations.each do |myRelation|
  #     @roomnum = Room.find_by(id: myRelation.roomid)
  #     @rooms.push([@roomnum.id,@roomnum.name,@roomnum.title,@roomnum.created_at.strftime('%Y/%m/%d %H:%M'),@roomnum.created_at])
  #   end
  # end

  # def relationdes
  #   @relationdes = Relation.find_by(userid: @user, roomid: params[:id])
  #   @relationdes.destroy
  #   redirect_to root_path, notice: 'Success!'
  # end
  

  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :new
    end
  end

  def edit
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path, notice: 'Success!'
  end

  
  private
    def set_user
      @user = current_user
    end
    def room_params
      params.require(:room).permit(:name, :title, :created_at)
    end
end
