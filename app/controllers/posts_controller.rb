class PostsController < ApplicationController
  def index
    @posts = Post.all
    @rooms = Room.all
  end
  
  def new
    @post = Post.new
  end

  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end

  
  def create
    redirect_to posts_confirm_path
  end

  # def confirm
  #   @post = Post.new(post_params)
  #   if @post.invalid?
	# 		render :new
	# 	end
  # end

  def complete
		Post.create!(post_params)
	end


  def show
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
    params.require(:post).permit(:startday, :endday, :peoples ,:fee, :user_id, :room_id)    
  end
end
