require 'rails_helper'

describe PartyParticipant, type: :model do
  describe "validations" do
    it {should belong_to(:party)}
    it {should belong_to(:user)}
  end
end
