class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    UserMailer.goodbye_email(@user).deliver
    # @user.destroy

    redirect_to movies_path, notice: "Deleted #{@user.firstname}"

  end

  def show
    @user = User.find(params[:id])
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

end