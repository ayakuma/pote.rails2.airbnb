class PostsController < ApplicationController
  def index
    @posts = Post.all
    @rooms = Room.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def confirm
    @post = Post.new(post_params)
    if @post.invalid?
			render :new
		end
  end

  def complete
		Post.create!(post_params)
	end


  def show
  end


  def edit
  end

  def destroy
  end


  private
  def post_params
    params.require(:post).permit(:startday, :endday, :peoples ,:fee, :user_id)    
  end
end
