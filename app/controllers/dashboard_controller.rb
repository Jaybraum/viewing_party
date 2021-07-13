class DashboardController < ApplicationController
  def index
    @current_user = current_user
    @friends = Friendship.users_friends(@current_user)
  end
end
