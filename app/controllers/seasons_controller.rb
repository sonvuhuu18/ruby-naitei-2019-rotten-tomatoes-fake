class SeasonsController < ApplicationController
  def show
    @user = User.new
    @season = Season.find_by id: params[:id]

    @top_new_show = Movie.create_top_new.top_new_show
    @top_new_more = @top_new_show.top_new_more

    @top_score_show = Movie.create_top_score.top_score_show
    @top_score_more = @top_score_show.top_score_more
  end
end
