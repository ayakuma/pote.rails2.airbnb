class RoomsController < ApplicationController

  def top
  end

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    @room.save
    redirect_to room_path(@room)
  end

  def show
    @room = Room.find(params[:id])

  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to room_path(@room)
  end

  def confirm
    @room = Room.find(params[:id])
    @room.confirm(room_params)
    redirect_to "/rooms/confirm"
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_index_path
  end

  private
  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :image, :startday, :endday, :peoples, :fee)
    
  end
end