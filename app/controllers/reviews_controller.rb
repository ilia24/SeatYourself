class ReviewsController < ApplicationController
  before_action :ensure_logged_in, only: [:create, :destroy]
  before_action :load_product


  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      flash[:notice] = "Review posted succesfully!"
      redirect_to restaurants_url
    else
      flash[:alert] = "Review NOT posted"
      render 'restaurants/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:comment, :restaurant_id)

  end

  def load_product
    @product = Product.find(params[:restaurant_id])
  end
end
