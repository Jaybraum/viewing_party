class PartyController < ApplicationController
  def create
      party = Party.create!(party_params)
      params[:invitees].each do |invitee|
        if invitee != ''
          friend_id = User.find_by(email: invitee).id
          PartyParticipant.create!(party_id: party.id, user_id: friend_id)
        end
      end
      flash[:success] = "Your party has been created!"
      redirect_to dashboard_index_path
  end

  def new
    @current_user = current_user
    @friendships = Friendship.users_friends(@current_user)
    @movie = MoviesDataFacade.get_movie_details_object(params[:movie_id])
    @party = Party.new
  end

  private

  def party_params
    params.permit(:host_id,
                  :movie_id,
                  :event_date,
                  :event_time,
                  :duration)
  end
end
