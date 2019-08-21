class SeasonsController < ApplicationController
  before_action :load_season, :build_movie_tvshow, only: :show
  def show; end

  private

  def load_season
    @season = Season.find_by id: params[:id]

    if @season
      @critic_score = @season.score :critic
      @audience_score = @season.score :normal
      @celebrities = Season.celebrities_list @season.id
    else
      flash[:danger] = t ".not_found"
      redirect_to seasons_url
    end
  end

  def build_movie_tvshow
    @top_score_movie = Movie.create_top_score
    @top_score_tvshow = TvShow.create_top_score
  end
end
