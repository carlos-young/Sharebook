class UsersController < ApplicationController
  def index
  @user= User.new
  end

  def show
  @user = User.all
  end

  def new
    @user = User.new
  end
  
  def create
  @user = User.new(params[:user])

  if @user.save
    flash[:status] = TRUE
    flash[:alert] = 'You have registered!'
  else
    flash[:status] = FALSE
    flash[:alert] = @user.errors.full_messages
  end

  redirect_to register_path  
end
end
