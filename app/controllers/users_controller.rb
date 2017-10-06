class UsersController < ApplicationController

  before_action :check_if_logged_in, :only => [:edit]
  before_action :check_if_admin, :only => [:index]
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to images_path
    else
      render :new
    end
  end

def edit
  @user = User.find params[:id]
end


def update
  @user = User.find params[:id]
  @user.update user_params
  redirect_to images_path
end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
