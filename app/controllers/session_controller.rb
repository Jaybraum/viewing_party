class SessionsController <ApplicationController
  def new
  end

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      flash[:error] = "The provided email is not associated with an account. Please register or try again."
      redirect_to login_path
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to dashboard_index_path
    else
      flash[:error] = "The password provided is incorrect. Please try again."
      redirect_to login_path
    end
  end