class Party < ApplicationRecord
  has_many :party_participants

  def get_title
    MoviesDataFacade.get_movie_title(self.movie_id)
  end

  def get_host
    User.find(self.host_id).email
  end

  def get_participants
    participant_ids = self.party_participants
    x = User.where(id: participant_ids).pluck(:email)
  end
end
