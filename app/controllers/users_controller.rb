class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], pass: params[:pass], img: "home.jpg",)
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to ("/users/#{@user.id}")
    else
      render "new"
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    # if params[:img]
    #   @user.img = "#{@user.id}.jpg"
    #   image = params[:img]
    #   File.binwrite("/#{@user.img}", image.read)
    # end

    if @user.update(email: params[:email], pass: params[:pass],name: params[:name],img: params[:img], introduction: params[:introduction])
      redirect_to("/users/index")
    else
      render "edit"
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to ("/users/index")
  end
  
  def account
    @user = User.find(params[:id])
  end

  def login_form

  end

  def login
    @user = User.find_by(email: params[:email], pass: params[:pass])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
end