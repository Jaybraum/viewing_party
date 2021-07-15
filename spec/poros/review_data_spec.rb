require 'rails_helper'

RSpec.describe ReviewDataObject do
  describe 'happy path' do
    it "builds a review data object", :vcr do

    review_data = APIService.grab_reviews_json(588228)[:results]

    movie_review = ReviewDataObject.new(review_data[0])

    expect(movie_review).to be_a(ReviewDataObject)
    expect(movie_review.author).to be_a(String)
    expect(movie_review.review).to be_a(String)
    end
  end
end
