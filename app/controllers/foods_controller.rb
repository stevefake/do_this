class Foods < ApplicationController
  def search
    parameters = { term: params[:term], limit: 3 }
    coordinates = { latitude: 37.7577, longitude: -122.4376 }
    results = Yelp.client.search_by_coordinates(coordinates, parameters)
    binding.pry
    render json: results
  end
end
