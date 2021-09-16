class RoomsController < ApplicationController
  before_action :set_user

  def index
    @rooms = Room.all  
    @rerations =  Relation.all  
  end
  
  def search
    # @rooms = Room.search(params[:keyword])
    # @keyword = params[:keyword]
    # render "index"
    @rooms = Room.all  
    @rerations =  Relation.all  
    @search_params = room_search_params  #検索結果の画面で、フォームに検索した値を表示するために、paramsの値をビューで使えるようにする
    @searchrooms = Room.search(@search_params)  #Reservationモデルのsearchを呼び出し、引数としてparamsを渡している。
    render "index"

  end

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

  def setting
  end

  private
    def set_user
      @user = current_user
    end
      def room_params
      params.require(:room).permit(:name, :title,:semester,:department,:created_at)
    end

    def room_search_params
      params.fetch(:search, {}).permit(:name, :title, :semester, :department)
      #fetch(:search, {})と記述することで、検索フォームに値がない場合はnilを返し、エラーが起こらなくなる
      #ここでの:searchには、フォームから送られてくるparamsの値が入っている
    end
end

