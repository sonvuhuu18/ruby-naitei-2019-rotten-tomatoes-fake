class Admin::SeasonsController < Admin::BaseController
  before_action :load_tvshow
  before_action :load_season, only: %i(show edit update destroy)

  def new
    @season = @tv_show.seasons.new
  end

  def show; end

  def edit; end

  def create
    @season = @tv_show.seasons.new season_params

    if @season.save
      flash[:success] = t ".create_success"
      redirect_to [:admin, @tv_show, @season]
    else
      flash[:danger] = t ".create_failed"
      render :new
    end
  end

  def update
    if @season.update_attributes season_params
      flash[:success] = t ".update_success"
      redirect_to [:admin, @tv_show, @season]
    else
      flash[:danger] = t ".update_failed"
      render :edit
    end
  end

  def destroy
    @season.destroy
    flash[:notice] = t ".delete_success"
    redirect_to [:admin, @tv_show]
  end

  private

  def season_params
    params.require(:season).permit Season::ATTR
  end

  def load_tvshow
    @tv_show = TvShow.find_by id: params[:tv_show_id]

    return if @tv_show
    flash[:danger] = t ".not_found"
    redirect_to admin_tv_shows_url
  end

  def load_season
    @season = @tv_show.seasons.find_by id: params[:id]

    return if @season
    flash[:danger] = t ".not_found"
    redirect_to admin_tv_show_url @tv_show
  end
end
