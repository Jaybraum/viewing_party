require 'rails_helper'

describe Friendship, type: :model do
  describe "validations" do
    it {should belong_to(:follower)}
    it {should belong_to(:followed)}
  end
end
