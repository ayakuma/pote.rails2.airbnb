class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], pass: params[:pass], img: params[:img], introduction: params[:introduction]
    )
    if @user.save
      redirect_to("/users/#{@user.id}")
    else
      render("user/new")
    end
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
  end

  def destroy
    @user = User.find(id: params[:id])
    @user.def destroy
      redirect_to :users

  end

  def account
    @user = User.find_by(id: params[:id])
  end
end

