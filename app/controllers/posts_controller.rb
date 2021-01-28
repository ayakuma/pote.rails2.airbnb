class PostsController < ApplicationController
  def index
    @posts = Post.all
    @rooms = Room.all
  end
  
  def new
    @post = Post.new
    @room = Room.find(params[:id])
  end

  def confirm
    @post = Post.new(post_params)
    @room = Room.new(post_params)
  end

  def create
    @post = Post.new(post_params)
    # @room = Room.find(params[:id])
    @post.user_id = current_user.id
    # @post.room_id = @room.id 
    if @post.save
      redirect_to posts_path
    else
      render :confirm
    end
  end

  # def show
  #   @post = Post.find(params[:id])
  # end


  def edit
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  private
  def post_params
    params.require(:post).permit(:startday, :endday, :peoples ,:fee)    
  end
end
