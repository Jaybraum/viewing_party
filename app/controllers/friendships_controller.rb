class FriendshipsController < ApplicationController
  def create
    # What in the world is going on here? Why do I need to do this?
    current_user = User.find(session[:user_id])
    desired_friend = User.find_by(email: params[:followed])
    if desired_friend.nil?
      require 'pry'; binding.pry
      flash[:error] = 'The provided email is not associated with an account. Please try again.'
      redirect_to dashboard_index_path
    elsif !Friendship.find_by(follower: current_user).nil? && !Friendship.find_by(followed: desired_friend).nil?
      require 'pry'; binding.pry
      flash[:error] = 'You are already friends with this individual!'
      redirect_to dashboard_index_path
    else
      require 'pry'; binding.pry
      flash[:success] = "#{desired_friend.email} has been added to your friends list!"
      x = Friendship.create(follower: current_user, followed: desired_friend)
      redirect_to dashboard_index_path
    end
  end
end
