class Party < ApplicationRecord
  has_many :party_participants, dependent: :destroy

  def grab_title
    MoviesDataFacade.grab_movie_title(movie_id)
  end

  def grab_host
    User.find(host_id).email
  end

  def grab_participants
    participant_ids = party_participants.pluck(:user_id)
    User.where(id: participant_ids).pluck(:email)
  end
end
