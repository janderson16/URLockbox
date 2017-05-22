class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome: #{@user.email}"
      session[:user_id] = @user.id
      redirect_to '/'
    elsif User.exists?(['email LIKE ?', "%#{@user.email}%"])
      flash[:error] = "Sorry, but that email has already been taken."
      redirect_to new_user_path
    elsif @user.password_digest == nil
      flash[:notice] = "Password cannot be blank"
      redirect_to new_user_path
    else @user.password_digest != @user.password_confirmation
      flash[:notice] = "Password and confirmation must match"
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
