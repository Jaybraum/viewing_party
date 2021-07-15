class FriendshipsController < ApplicationController
  def create
    @current_user = current_user
    desired_friend = User.find_by(email: params[:followed])
    if desired_friend.nil?
      flash[:error] = 'The provided email is not associated with an account. Please try again.'
    elsif !Friendship.find_by(follower: current_user, followed: desired_friend).nil?
      flash[:error] = 'You are already friends with this individual!'
    else
      flash[:success] = "#{desired_friend.email} has been added to your friends list!"
      Friendship.create(follower: current_user, followed: desired_friend)
    end
    redirect_to dashboard_index_path
  end
end
