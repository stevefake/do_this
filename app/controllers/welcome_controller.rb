class WelcomeController < ApplicationController
  def index
  end

  def search
    parameters = { term: params[:term], limit: 16 }
    render json: Yelp.client.search('Washington DC', parameters)
  end

  # def search
  #   parameters = { term: params['?q=attractions'], limit: 10 } #display only one tho and user can swipe thru for the rest
  #   render json: Yelp.client.search('Shake Shack', parameters)
  # end
end
