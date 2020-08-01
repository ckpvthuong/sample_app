class UsersController < ApplicationController

  # GET /users
  def index
    @users = User.all
  end
  
  # GET /users/new
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    # debugger
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'  
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
