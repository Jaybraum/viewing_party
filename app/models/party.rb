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
end
