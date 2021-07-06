class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if !User.find_by(email: params[:user][:email]).nil?
      flash[:email_exists_failure] = "This email is already associated with an account. Please log in."
      redirect_to register_path
    elsif params[:user][:password] != params[:user][:password_confirmation]
      flash[:password_confirmation_failure] = "Passwords do not match! Please enter the same password twice."
      redirect_to register_path
    else
      user = user_params
      user[:email] = user[:email].downcase
      new_user = User.create(user)

      flash[:success] = "Welcome, #{new_user.email}!"
      #DASHBOARD PAGE
      redirect_to register_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
