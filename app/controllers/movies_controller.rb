class MoviesController < ApplicationController
  before_action :load_movie, only: :show

  def index; end

  def show
    @movies_top_new = Movie.create_top_new
    @movies_top_score = Movie.create_top_score
  end

  private

  def load_movie
    @movie = Movie.find_by id: params[:id]

    return if @movie
    flash[:danger] = t ".not_found"
    redirect_to movies_url
  end
end
