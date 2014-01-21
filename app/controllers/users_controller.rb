class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      log_in!(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def index
    if !!current_user
      @user = current_user
    else
      @user = User.new({username: "Guest", fname: "Captain", lname: "Cuddles"})
    end
    render "index"
  end
  
  def show
    if !!current_user
      @user = current_user
    else
      @user = User.new({username: "Guest", fname: "Captain", lname: "Cuddles"})
    end
    render "index"
  end
  
end
