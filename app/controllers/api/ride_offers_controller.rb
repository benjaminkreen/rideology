class Api::RideOffersController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def index
    @ride_offers = RideOffer.all
    render json: @ride_offers
  end

  def show
  end

  def destroy
  end
end
