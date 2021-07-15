class MoviesController < ApplicationController
  def index
    @current_user = current_user
    case params[:commit]
    when 'Search'
      @movies = MoviesDataFacade.find_movies_by_title(params[:search])
      flash[:error] = 'There are no movies matching your search.' if @movies.empty?
    when 'Find Top Rated Movies'
      @movies = MoviesDataFacade.generate_top_movie_objects
    end
  end

  def show
    @movie = MoviesDataFacade.generate_movie_details_object(params[:id])
  end
end
