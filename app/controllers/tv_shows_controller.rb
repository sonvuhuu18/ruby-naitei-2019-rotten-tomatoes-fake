class TvShowsController < ApplicationController
  before_action :load_tvshow, except: %i(index new create)

  def index; end

  def show; end

  private

  def load_tvshow
    @tv_show = TvShow.find_by id: params[:id]

    return if @tv_show
    flash[:danger] = t ".not_found"
    redirect_to tv_shows_url
  end
end
