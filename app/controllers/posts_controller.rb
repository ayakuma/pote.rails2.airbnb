class PostsController < ApplicationController
  def index
    @posts = Post.all
    @rooms = Room.all
  end
  
  def new
    @post = Post.new
    # binding.pry
    @room = Room.find(params[:id])
  end
  
  def confirm
    @post = Post.new(post_params)
    @post.user_id = current_user.id 
    @room = Room.find(params[:id])
    @post.room_id = @room.id
    @post.room_name = @room.name
    @post.room_image = @room.image
    @post.room_introduction = @room.introduction
    render :confirm if @post.invalid?
    @post.fee = @room.price * @post.peoples * (@post.endday.to_date - @post.startday.to_date).to_i
    # binding.pry
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      flash[:notice] = "エラーが発生しました、下記ご確認の上、再度お試しください。"
      render :confirm
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end


  def edit
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  private
  def post_params
    params.require(:post).permit(:user_id, :room_id,:room_name,:room_image,:room_introduction, :startday, :endday, :peoples ,:fee)    
  end

  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :image)
  end
end
