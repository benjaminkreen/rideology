class Api::RideOffersController < ApplicationController
  def new
  end

  def create
    @ride_offer = RideOffer.new(params[:ride_offer])
    if !current_user
      flash[:errors] = ["Must be logged in to post ride"]
      redirect_to new_session_url
    end
    @ride_offer.user_id = current_user.id
    if @ride_offer.save
      p "Success"
      render json: @ride_offer
    else
      p "ERROR ERROR ERROR"
      p @ride_offer.errors.full_messages.join(', ')
      render json: @ride_offer.errors.full_messages
    end
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
