class AttractionsController < ApplicationController

  def index
  end
  
  def show
    session[:coordinates] = {
      latitude: (params['latitude'] || session['coordinates']['latitude']).to_f,
      longitude: (params['longitude'] || session['coordinates']['longitude']).to_f
    }
    session[:choice] = { term: params['term'] || session['choice']['term'], limit: 6 }
    @results = Yelp.client.search_by_coordinates(session[:coordinates], session[:choice])
    index = params[:id].to_i - 1
    @result = @results.businesses[index]
  end
end
