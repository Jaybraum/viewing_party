class ReviewDataObject
  attr_reader :author,
              :review

  def initialize(review)
    @author = review[:author]
    @review = review[:content]
  end
end
