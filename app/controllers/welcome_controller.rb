class WelcomeController < ApplicationController
  def index
  end

  def search
    parameters = { term: params[:term], limit: 6 }
    coordinates = { latitude: 37.7577, longitude: -122.4376 }
    @results = Yelp.client.search_by_coordinates(coordinates, parameters)
  end

 #display only one tho and user can swipe thru for the rest

  def show
    # @hungry = Hungry.find(params[:id])  # so that's how i'd pass in the :id from the db
    parameters = { term: params[:term], limit: 6 }
    coordinates = { latitude: 37.7577, longitude: -122.4376 }
    @results = Yelp.client.search_by_coordinates(coordinates, parameters)
    index = pms[:id].to_i - 1
    @result = @results.businesses[index]
    # render action: 'show'
  end

end
