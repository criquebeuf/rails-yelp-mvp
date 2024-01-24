class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]
  def new
    # need the correct restaurant -> see before_action
    # need an empty instance of review
    @review = Review.new
  end

  def create
    # create a new review when they click on the submit button
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
