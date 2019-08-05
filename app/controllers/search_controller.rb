class SearchController < ApplicationController
  before_action :build_user, only: :index
  def index
    keyword = params[:keyword]
    search_by = params[:search_by]

    if search_by == "Name"
      @movies = Movie.search_by_name keyword
      @tvshows = TvShow.search_by_name keyword
    elsif search_by == "Year"
      @movies = Movie.search_by_release_year keyword
      @tvshows = TvShow.search_by_release_year keyword
    end
  end

  private

  def build_user
    @user = User.new
  end
end
