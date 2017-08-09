class ReviewsController < ApplicationController
  before_action :set_review, only: [ :show, :edit, :update, :destroy]
  def index
  end

  def show
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save
      redirect_to restaurant_path(params[:restaurant_id])
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  protected

  def set_review
    @review = Review.find(params[:id])
  end

  def params_review
    params.require(:review).permit(:content, :rating)
  end
end
