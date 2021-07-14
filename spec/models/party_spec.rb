require 'rails_helper'

describe Party, type: :model do
  describe "validations" do
    it {should have_many :party_participants}
  end

  describe 'class methods' do
    xit 'find_friends' do

      expect(Party.find_friends).to eq()
    end
  end
end
