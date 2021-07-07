class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if !User.find_by(email: params[:user][:email]).nil?
      flash[:error] = "This email is already associated with an account. Please log in."
      redirect_to register_path
    elsif params[:user][:password] != params[:user][:password_confirmation]
      flash[:error] = "Passwords do not match! Please enter the same password twice."
      redirect_to register_path
    else
      user = user_params
      user[:email] = user[:email].downcase
      new_user = User.create(user)

      flash[:success] = "Welcome, #{new_user.email}!"
      redirect_to dashboard_index_path
    end
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    if user.nil?
      flash[:error] = "The provided email is not associated with an account. Please register or try again."
      redirect_to login_path
    elsif user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to dashboard_index_path
    else
      flash[:error] = "The password provided is incorrect. Please try again."
      redirect_to login_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
