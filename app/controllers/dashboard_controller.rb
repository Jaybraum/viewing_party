class DashboardController < ApplicationController
  def index
    @current_user = current_user
    @friends = Friendship.users_friends(@current_user)
    @parties_hosting = @current_user.parties_hosting
    @parties_participating = @current_user.parties_participating
  end
end
