class MoviesController < ApplicationController
  def index
    @current_user = current_user
    if params[:commit] == "Search"
      @movies = MoviesDataFacade.find_movies_by_title(params[:search])
      if @movies.empty?
        flash[:error] = 'There are no movies matching your search.'
      end
    elsif params[:commit] == "Find Top Rated Movies"
      @movies = MoviesDataFacade.get_top_movie_objects
    end
  end

  def show
     @movie = MoviesDataFacade.get_movie_details_object(params[:id])
  end
end
