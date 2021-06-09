class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
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
  
  private
    def room_params
      params.require(:room).permit(:name, :title,:created_at)
    end
  
end
