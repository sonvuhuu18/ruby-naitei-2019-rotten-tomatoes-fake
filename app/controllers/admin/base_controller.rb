class Admin::BaseController < ApplicationController
  before_action :authenticate_user!, :check_admin
  layout "admin"

  private

  def check_admin
    return if current_user.admin?
    flash[:danger] = t "admin.not_admin"
    redirect_to root_url
  end
end
