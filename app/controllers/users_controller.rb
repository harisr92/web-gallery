class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @images =@user.images.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to web gallery"
      redirect_to root_url
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require("user").permit(:name, :avatar, :email, :password, :password_confirmation)
    end
end
