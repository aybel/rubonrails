class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  # GET /cities
  def index
    if params[:country_id].present?
      @cities = City.where(country_id: params[:country_id])
    else
      @cities = City.all
    end
    render json: @cities.select(:id, :name)
  end

  # GET /cities/1
  def show
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities
  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to @city, notice: 'City was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cities/1
  def update
    if @city.update(city_params)
      redirect_to @city, notice: 'City was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cities/1
  def destroy
    @city.destroy
    redirect_to cities_url, notice: 'City was successfully destroyed.'
  end

  private def set_city
      @city = City.find(params[:id])
  end

  private def city_params
      params.require(:city).permit(:name, :population, :country)
  end
end