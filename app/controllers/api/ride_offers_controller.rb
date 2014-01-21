class Api::RideOffersController < ApplicationController
  def new
  end

  def create
    @ride_offer = RideOffer.new(params[:ride_offer])
    @ride_offer.user_id = current_user.id
    if @ride_offer.save
      render json: @ride_offer
    else
      p @ride_offer.errors.full_messages.join(', ')
      render json: @ride_offer.errors.full_messages
    end
  end

  def edit
  end

  def update
  end

  def index
    @ride_offers = RideOffer.page(params[:page]).per(10)
    render :json => {
      ride_offers: @ride_offers,
      page_number: params[:page],
      total_pages: @ride_offers.total_pages
    }
  end

  def show
  end

  def destroy
  end
end
