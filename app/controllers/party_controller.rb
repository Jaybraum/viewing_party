class PartyController < ApplicationController
  def create
    @current_user = current_user
    @friendships = Friendship.users_friends(@current_user)
    @movie = MoviesDataFacade.get_movie_details_object(params[:movie_id])
    if params[:duration].to_i < @movie.runtime
      flash[:error] = 'The duration of your viewing party cannot be shorter than the duration of the movie.'
      redirect_to new_party_path(movie_id: @movie.movie_id)
    else
      friends = Party.find_friends(params)
      party = Party.create!(host_id: @current_user.id,
                            movie_id: params[:movie_id],
                            event_date: params[:event_date],
                            event_time: params[:event_time],
                            duration: params[:duration])
      friends.each do |friend|
        friend_id = User.find_by(email: friend).id
        PartyParticipant.create!(party_id: party.id, user_id: friend_id)
      end
      flash[:success] = "Your party has been created!"
      redirect_to dashboard_index_path
    end
  end

  def new
    @current_user = current_user
    @friendships = Friendship.users_friends(@current_user)
    @movie = MoviesDataFacade.get_movie_details_object(params[:movie_id])
  end
end
