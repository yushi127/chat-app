class RoomsController < ApplicationController
  before_action :set_user, only: [:index, :search]

  def index
    @rooms = Room.all
  end
  
  def search
    @rooms = Room.search(params[:keyword])
    @keyword = params[:keyword]
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
    # @user = current_user
  end
  
  private
    def set_user
      @user = current_user
    end
      def room_params
      params.require(:room).permit(:name, :title,:created_at)
    end
  
end
