class MyroomsController < ApplicationController
  before_action :set_user

  def index
    @rerations =  Relation.all  
    @user = current_user
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
  def search
    @rerations =  Relation.all  

    @rooms = Room.all  
    @rerations =  Relation.all  
    @search_params = room_search_params  #検索結果の画面で、フォームに検索した値を表示するために、paramsの値をビューで使えるようにする
    @searchrooms = Room.search(@search_params)  #Reservationモデルのsearchを呼び出し、引数としてparamsを渡している。
    # ///////////////////////////////////////////////////////
#     @relationusers = Relation.where(userid: @user.id)
#     @aa = @relationusers
#     count = @searchrooms.length
#     i = 0
#     @relationrooms = []
#     while i < count 
#       @aaa = @searchrooms.where(id: @relationusers[i].roomid).first
# # @relationmyroom
#       @relationroom = Room.where(id: @relationmyroom.id)
#       @relationrooms.push(@relationroom)
#       i+=1
#     end
    @relationrooms = []
    @relationusers = Relation.where(userid: @user.id)
    @aa = @relationusers
    i = 0
    counti = @relationusers.length
    countj = @searchrooms.length

    while i <  counti 
      # byebug
      j=0
        while j <  countj
          @relationmyroom = Room.where(id: @searchrooms[j].id).where(id:@relationusers[i].roomid).first
          unless @relationmyroom.blank?  
            @relationrooms.push(@relationmyroom)
          end
          j+=1
        end
      i+=1
    end
    render "index"
  end

  def destroy
    @user = current_user
    @relationdes = Relation.find_by(userid: @user, roomid: params[:id])
    @relationdes.destroy
    redirect_to myrooms_path, notice: 'Success!'
  end

  private  
  def set_user
    @user = current_user
  end
  def room_search_params
    params.fetch(:search, {}).permit(:name, :title, :semester, :department)
    #fetch(:search, {})と記述することで、検索フォームに値がない場合はnilを返し、エラーが起こらなくなる
    #ここでの:searchには、フォームから送られてくるparamsの値が入っている
  end
end
