class Party < ApplicationRecord
  has_many :party_participants

  def self.find_friends(params)
    friends = []
    count = 0
    keys = params.keys

    until keys[count] == "event_time"
      count += 1
    end

    count += 1

    until keys[count] == "movie_id"
      friends << keys[count]
      count += 1
    end

    friends
  end

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
