class Admin::MoviesController < Admin::BaseController
  before_action :load_movie, except: %i(index new create)

  def index
    @movies = Movie.all.page(params[:page]).per Settings.movies.paginate
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new movie_params

    if @movie.save
      flash[:success] = t ".create_success"
      redirect_to admin_movie_path(@movie)
    else
      flash[:danger] = t ".create_failed"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @movie.update_attributes movie_params
      flash[:success] = t ".update_success"
      redirect_to admin_movie_path(@movie)
    else
      flash[:danger] = t ".update_fail"
      render :edit
    end
  end

  def destroy
    if @movie.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_failed"
    end
    redirect_to admin_movies_url
  end

  private

  def movie_params
    params.require(:movie).permit Movie::ATTR
  end

  def load_movie
    @movie = Movie.find_by id: params[:id]

    return if @movie
    flash[:danger] = t ".not_found"
    redirect_to admin_movies_url
  end
end
