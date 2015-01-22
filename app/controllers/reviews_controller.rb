class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new]
	before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
  	@reviews = Review.all
  end

  def show
  end

  def new
  	@review = Review.new
  end

  def create
  	@review = Review.new(review_params)

  	if @review.save
  		redirect_to attraction_api_path(activities_unique_id: @review.unique_id)
  	else
  		render :new
  	end
  end

  def edit
  end
  
  def update
  	if @review.update_attributes(review_params)
  		redirect_to attraction_api_path(activities_unique_id: @review.unique_id)
  	else
  		render :edit
  	end
  end

  def destroy
  	@review.destroy
  	redirect_to attraction_api_path(activities_unique_id: @review.unique_id)
  end
  
  private

  def review_params
  	params.require(:review).permit(:name, :rating, :body, :unique_id)
  end

  def set_review
  	@review = Review.find(params[:id])
  end
end
