class RequestsController < ApplicationController
  before_action :authenticate_user!, :check_role

  def create
    @request = current_user.requests.build request_params
    if @request.save
      flash[:success] = t ".create_success"
    else
      flash[:danger] = t ".create_failed"
    end
    redirect_to current_user
  end

  private

  def request_params
    params.require(:request).permit Request::ATTR
  end

  def check_role
    return if current_user.normal?
    flash[:danger] = t ".wrong_role"
    redirect_to current_user
  end
end
