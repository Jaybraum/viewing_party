class MoviesController < ApplicationController
  def index
    @current_user = current_user
    @movie_data = MovieData.new
  end

  def search
    @found_movies = MovieData.new.search(params[:search])
    # data = APIService.connect(MOVIE_PATH)
    # movies = data[:results]
    # @found_movies = movies.find do |movie|
    #   movie[:original_title] == params[:search]
    # end
  end
end
