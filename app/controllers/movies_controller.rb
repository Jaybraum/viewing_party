class MoviesController < ApplicationController
  def index
    @current_user = current_user
    if params[:commit] == "Search"
      require 'pry'; binding.pry
      # build in flash here
    elsif params[:commit] == "Find Top Rated Movies"
      @movies = MoviesDataFacade.get_top_movie_objects
    end
  end

  def search
    @found_movies = MoviesDataFacade.find_movies_by_title(params[:search])
  end

  # def search_top
  #   @found_movies = MoviesDataFacade.get_top_movie_objects
  # end


  def show
     @movie = MoviesDataFacade.get_movie_details_object(params[:id])
  end
end
