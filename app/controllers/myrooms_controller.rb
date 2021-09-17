class MyroomsController < ApplicationController

  def index
    @rerations =  Relation.all  
    @user = current_user
    @myRelations = Relation.where(userid: @user.id)
   # //下でループさせるから@roomsをあらかじめ定義する
   @rooms = Room.all
   # //@roomsのなかにcurrent_userが入ってるルームを追加する
   
   @relationrooms = []
   @relationusers = Relation.where(userid: @user.id)
   @aa = @relationusers
   i = 0
   count = @relationusers.length
   while i <  count 
     @relationroom = Room.where(id: @relationusers[i].roomid).first
     @relationrooms.push(@relationroom)
     i+=1
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
def search
    @rerations =  Relation.all  
    @rooms = Room.all  
    @search_params = room_search_params  #検索結果の画面で、フォームに検索した値を表示するために、paramsの値をビューで使えるようにする
    # すべてのROOMから検索した結果を入れる
    @searchrooms = Room.search(@search_params)  #Reservationモデルのsearchを呼び出し、引数としてparamsを渡している。
    
    # rerationから現在ログイン中のユーザーのレコード取得
    relationusers = Relation.where(userid: @user.id)
    # 変数定義
    i = 0
    @relationrooms = []
    counti = relationusers.length
    countj = @searchrooms.length
    # ルームのIDがrerationから現在ログイン中のユーザーのレコードとすべてのROOMから検索した結果が同じとこ取得
    # 取得したものを@relationroomsのPUSH
    while i <  counti 
      # byebug
      j=0
        while j <  countj
          @relationmyroom = Room.where(id: @searchrooms[j].id).where(id:relationusers[i].roomid).first
          unless @relationmyroom.blank?  
            @relationrooms.push(@relationmyroom)
          end
          j+=1
        end
      i+=1
    end
    render "index"
  end
end
