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

  def confirm
    @post = Post.new(post_params)
    @room = Room.find(params[:id])
    @post.user_id = current_user.id 
    @post.room_id = Room.find(params[:id])
    @post.room_id = @room.id
    @post.fee = @room.price * @post.peoples * (@post.endday.to_date - @post.startday.to_date).to_i
    render :confirm if @post.invalid?

    # if @post.save
    #   redirect_to posts_path
    # else
    #   render :confirm
    # end

    # @post.room_name = @room.name
    # @post.room_img = @room.img
    # render :confirm if @post.invalid?
    # binding.pry
  end
  
  def create
    @room = Room.new(room_params)
    @room.save
    redirect_to room_path(@room)

    @post = Post.new(post_params)
    @post.user_id = current_user.id 
    @room = Room.find(params[:id])
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