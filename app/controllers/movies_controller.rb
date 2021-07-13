class MoviesController < ApplicationController
  def index
    @current_user = current_user
    if params[:commit] == "Search"
      @movies = MoviesDataFacade.find_movies_by_title(params[:search])
      # build in flash here
    elsif params[:commit] == "Find Top Rated Movies"
      @movies = MoviesDataFacade.get_top_movie_objects
    end
  end

  def show
     @movie = MoviesDataFacade.get_movie_details_object(params[:id])
    # @viewing_party = ViewingParty.new
  end
end
