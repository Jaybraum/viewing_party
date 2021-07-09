require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
    it {should define_enum_for(:role).with([:user, :admin])}
    # Not sure what to do about this...
    it {should have_many :friendships}
  end
end
