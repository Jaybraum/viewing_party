class MoviesController < ApplicationController
  def index
    @current_user = current_user
    @movie_data = MovieData.new
  end
end
