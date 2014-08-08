class Admin::UsersController < ApplicationController

  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end


  def create
    @user = User.create(user_params)

    if @users.persisted?
      redirect_to users_url, notice: "Success"
    else
      flash.now[:error] = "problem" # flash.now for render
      # render :new
      redirect_to new_user_url  # , flash: {error: "Could not save record."}
    end
  end



  def edit
    @user = User.find(params[:id])
  end





  private

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end



end
