class MoviesController < ApplicationController
  include ReviewsHelper
  before_action :load_movie, :build_user, only: :show

  def index
    @movies = Movie.create_desc.page(params[:page]).per Settings.movies.paginate
  end

  def show
    @top_new_show = Movie.create_top_new.top_new_show
    @top_new_more = @top_new_show.top_new_more

    @top_score_show = Movie.create_top_score.top_score_show
    @top_score_more = @top_score_show.top_score_more

    @review = Review.new

    @critic_score = @movie.critic_score
    @critic_score = @critic_score == 0 ? "N/A" : @critic_score.round(1)

    @audience_score = @movie.audience_score
    @audience_score = @audience_score == 0 ? "N/A" : @audience_score.round(1)
  end

  private

  def load_movie
    @movie = Movie.find_by id: params[:id]

    return if @movie
    flash[:danger] = t ".not_found"
    redirect_to movies_url
  end

  def build_user
    @user = User.new
  end
end
