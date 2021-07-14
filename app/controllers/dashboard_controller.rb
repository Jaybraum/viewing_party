class DashboardController < ApplicationController
  def index
    @current_user = current_user
    @friends = Friendship.users_friends(@current_user)
    @parties = @current_user.user_parties
    @facade = MoviesDataFacade.new
  end
end
