class Admin::EpisodesController < Admin::BaseController
  before_action :load_tvshow, :load_season
  before_action :load_episode, only: %i(show edit update destroy)

  def new
    @episode = @seasons.episodes.new
  end

  def show; end

  def edit; end

  def create
    @episode = @season.episodes.new episode_params

    if @episode.save
      flash[:success] = t ".create_success"
      redirect_to [:admin, @tv_show, @season, @episode]
    else
      flash[:danger] = t ".create_failed"
      render :new
    end
  end

  def update
    if @episode.update_attributes episode_params
      flash[:success] = t ".update_success"
      redirect_to [:admin, @tv_show, @season, @episode]
    else
      flash[:danger] = t ".update_failed"
      render :edit
    end
  end

  def destroy
    @episode.destroy
    flash[:notice] = t ".delete_success"
    redirect_to [:admin, @tv_show, @season]
  end

  private

  def episode_params
    params.require(:episode).permit Episode::ATTR
  end

  def load_tvshow
    @tv_show = TvShow.find_by id: params[:tv_show_id]

    return if @tv_show
    flash[:danger] = t ".not_found"
    redirect_to admin_tv_shows_url
  end

  def load_season
    @season = @tv_show.seasons.find_by id: params[:season_id]

    return if @season
    flash[:danger] = t ".not_found"
    redirect_to admin_tv_show_url @tv_show
  end

  def load_episode
    @episode = @season.episodes.find_by id: params[:id]

    return if @episode
    flash[:danger] = t ".not_found"
    redirect_to admin_tv_show_season_url @tv_show, @season
  end
end
