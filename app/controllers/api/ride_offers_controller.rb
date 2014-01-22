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
    if params[:search_origin] || params[:search_destination] || params[:search_date]
      origin = params[:search_origin] || '*'
      destination = params[:search_destination] || '*'
      date = params[:search_date] || '*'
      @ride_offers = RideOffer.where("origin LIKE ? AND destination LIKE ? AND date = ?", origin, destination, date)
      render :json => {
        ride_offers: @ride_offers
      }
      
    else
      @ride_offers = RideOffer.page(params[:page]).per(10)
      render :json => {
        ride_offers: @ride_offers,
        page_number: params[:page],
        total_pages: @ride_offers.total_pages
      }
    end
  end

  def show
  end

  def destroy
  end
end
