class SessionsController < ApplicationController

  def geolocation
    @latitude = { latitude: params[:latitude] }
    @longitude = { longitude: params[:longitude] }
  end

  def choice
    @parameters = { term: params[:term] }
  end

  def show
    redirect_to bored_path
  end
end
