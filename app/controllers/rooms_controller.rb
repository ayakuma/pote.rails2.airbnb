class RoomsController < ApplicationController

  def top
  end

  def index
    @rooms = Room.all
 
  end

  def new
    @room = Room.new
    @post = Post.new    
  end
  
  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id 
    if @room.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @post = Post.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to room_path(@room)
  end

  def hostprof
    @room = Room.find(params[:id])
  end

  def myrooms 
    @room = Room.find(params[:id])
    @myroom = @room.user_id == current_user.id
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_index_path
  end

  private
  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :image)
  end
  def post_params
    params.require(:post).permit(:startday, :endday, :peoples ,:fee)    
  end

end