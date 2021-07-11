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

  def show
    movies = MovieData.new

    # Replace this with params search once Jermaine finishes top/search movies views
    movie = movies.top_forty.first

    @movie_details = movies.movie_details(movie)
  end
end
