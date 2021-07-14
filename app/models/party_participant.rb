class PartyParticipant < ApplicationRecord
  belongs_to :party
  belongs_to :user

  def self.user_parties(user)
    where(host_id: user.id)
  end
end
