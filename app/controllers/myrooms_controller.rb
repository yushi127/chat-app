class MyroomsController < ApplicationController

  def index
    @user = current_user
    @myRelations = Relation.where(userid: @user.id)
      # //下でループさせるから@roomsをあらかじめ定義する
    @rooms = []
       # //@roomsのなかにcurrent_userが入ってるルームを追加する
    @myRelations.each do |myRelation|
      @roomnum = Room.find_by(id: myRelation.roomid)
      @rooms.push([@roomnum.id,@roomnum.name,@roomnum.title,@roomnum.created_at.strftime('%Y/%m/%d %H:%M'),@roomnum.created_at])
    end
  end
  def destroy
    @user = current_user
    @relationdes = Relation.find_by(userid: @user, roomid: params[:id])
    # @roomid = @relationdes.
    if @relationdes.destroy
      flash[:notice] = "離脱しました"
      redirect_to myrooms_path
    end
  end

end
