class ReviewsController < ApplicationController
  def index
  	@reviews = Review.all
  end

  def show
  	@review = Review.find(params[:id])
  end

  def new
  	@review = Review.new
  end

  def create
  	@review = Review.new(review_params)

  	if @review.save
  		redirect_to reviews_path
  	else
  		render :new
  	end
  end

  private

  def review_params
  	params.require(:review).permit(:name, :rating, :body)
  end
end
