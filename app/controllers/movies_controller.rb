class MoviesController < ApplicationController
  include ReviewsHelper
  before_action :load_movie, only: :show
  before_action :build_movie_tvshow, only: %i(index show)

  def index
    @movies = Movie.create_desc.page(params[:page]).per Settings.paginate
  end

  def show; end

  private

  def load_movie
    @movie = Movie.find_by id: params[:id]

    if @movie
      @review = Review.new
      @critic_score = @movie.score :critic
      @audience_score = @movie.score :normal
      @celebrities = Movie.celebrities_list @movie.id
    else
      flash[:danger] = t ".not_found"
      redirect_to movies_url
    end
  end

  def build_movie_tvshow
    @top_score_movie = Movie.create_top_score
    @top_score_tvshow = TvShow.create_top_score
  end
end
