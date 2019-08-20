class Admin::RequestsController < Admin::BaseController
  before_action :load_request, only: %i(update destroy)

  def index
    @requests = Request.update_desc.page(params[:page])
      .per Settings.requests.paginate
  end

  def update
    @request.update_attribute :status, params[:request][:status]
    respond_to :js
  end

  def destroy
    if @request.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_failed"
    end
    redirect_to admin_requests_path
  end

  private

  def update_params
    params.require(:request).permit :status
  end

  def load_request
    return if @request = Request.find_by(id: params[:id])
    flash[:danger] = t ".not_found"
    redirect_to admin_requests_path
  end
end
