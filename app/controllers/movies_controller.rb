class MoviesController < ApplicationController
  def index
    @current_user = current_user
    require 'pry'; binding.pry
    @movie_data = MovieData.new
    require 'pry'; binding.pry
  end
end
