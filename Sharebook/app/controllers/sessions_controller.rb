class SessionsController < ApplicationController

  def new
  @sessions = Sessions.new
  end
  
  def create
    @sessions = Sessions.new(params[:sessions])
    if @sessions.save
      flash[:notice] = "login successful!"
      redirect_back_or_default user_path
    else
      render :action => :new
    end
  end
  
  def destory
  end
end
