class Api::RideTakesController < ApplicationController
  def create
    @ride_take = RideTake.new(params[:ride_take])
    @ride_take.user_id = current_user.id
    if @ride_take.save
      render json: @ride_take
    else
      render json: @ride_take.errors, status: 422
    end
  end

  def destroy
  end
end
