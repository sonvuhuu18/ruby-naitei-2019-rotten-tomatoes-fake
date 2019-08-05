class ReviewsController < ApplicationController
  before_action :load_review, only: :destroy

  def create
    @review = current_user.reviews.build review_params

    if @review.save
      flash[:success] = t ".create_success"
    else
      flash[:danger] = t ".create_failed"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    if @review.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_failed"
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def review_params
    params.require(:review).permit Review::ATTR
  end

  def load_review
    @review = Review.find_by id: params[:id]

    return if @review
    flash[:danger] = t ".not_found"
    redirect_back(fallback_location: root_path)
  end
end
