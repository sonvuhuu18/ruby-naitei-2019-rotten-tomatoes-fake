class Admin::NewsController < Admin::BaseController
  before_action :load_news, except: :index
  def index
    @all_news = News.update_desc.page(params[:page]).per Settings.news.paginate
  end

  def show; end

  def update
    if @news.update_attributes news_params
      flash[:success] = t ".update_success"
    else
      flash[:danger] = t ".update_fail"
    end
    respond_to :js
  end

  def destroy
    if @news.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_failed"
    end
    redirect_to admin_news_index_path
  end

  private

  def news_params
    params.require(:news).permit News::ATTR
  end

  def load_news
    return if @news = News.find_by(id: params[:id])
    flash[:danger] = t ".not_found"
    redirect_to admin_news_index_path
  end
end
