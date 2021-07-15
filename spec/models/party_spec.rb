require 'rails_helper'

describe Party, type: :model do
  describe "validations" do
    it {should have_many :party_participants}
  end
end
