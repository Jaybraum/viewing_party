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

      session[:user_id] = new_user.id
      redirect_to dashboard_index_path if current_user.user?
      redirect_to admin_dashboard_path if current_user.admin?
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
