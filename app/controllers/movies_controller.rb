class MoviesController < ApplicationController
  def index
    @current_user = current_user
    @movie_data = MovieData.new
  end

  def search
    @found_movies = MovieData.new.search(params[:search])
  end

  def show
    # movies = MovieDataObject.new

    # # Replace this with params search once Jermaine finishes top/search movies views
    # movie = movies.top_forty.first

    # @movie_details = movies.movie_details(movie)

    @movie = MovieDataFacade.new(params[:whatever])
  end
end
