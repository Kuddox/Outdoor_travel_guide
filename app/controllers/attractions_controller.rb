class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new]
  
  def show
  end

  def attractions_api
    @api_unique_id_results = Apis::TrailsApi.get_trails_data_id(params['activities_unique_id'])
    @reviews = Review.where(unique_id: params['activities_unique_id'])
  end

  def api_index
    @api_results = Apis::TrailsApi.get_trails_data(params['city_location'], params['activty_type'])
    @map = Gmaps4rails.build_markers(@attractions) do |attraction, marker|
      marker.lat attraction.latitude
      marker.lng attraction.longtitude
    end

  end

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction
    else
      render :new 
    end
  end

  def edit
  end

  def update
    if @attraction.update_attributes(attraction_params)
      redirect_to @attraction
    else
      render :edit
    end
  end

  def destroy
    @attraction.destroy
    redirect_to attractions_url
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:title, :category, :url, :photo)
  end

end
