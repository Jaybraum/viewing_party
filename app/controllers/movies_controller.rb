class MoviesController < ApplicationController
  def index
    @current_user = current_user
  end

  def search
    @found_movies = MoviesDataFacade.find_movies_by_title(params[:search])
  end

  def search_top
    @found_movies = MoviesDataFacade.get_top_movie_objects
  end


  def show
     @movie = MovieDataFacade.get_movie_objects.find(params[:title])

    # # Replace this with params search once Jermaine finishes top/search movies views

    # @movie_details = movies.movie_details(movie)
  end
end
