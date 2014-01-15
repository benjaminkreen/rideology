class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end
end
