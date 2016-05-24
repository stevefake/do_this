class PickController < ApplicationController

  def show
    session[:coordinates] = {
      latitude: (params['latitude'] || session['coordinates']['latitude']).to_f,
      longitude: (params['longitude'] || session['coordinates']['longitude']).to_f
    }
    # params[:i] = params[:i].to_i - 1
    session[:choice] = { term: params['term'] || session['choice']['term'], limit: 6 } #limit: params[:i], offset: 1
    @results = Yelp.client.search_by_coordinates(session[:coordinates], session[:choice])
    index = params[:i].to_i - 1

    # nearbys = Attraction.near(session[:coordinates].values)
    # if (nearbys != '#<ActiveRecord::Relation []>') #== nil # && flag
    #   flash[:notice] = 'You are near one of your saved destinations!'
    # elsif nearbys.nil? == false && flag == false
    #   session[:choice] = { term: params['term'] || session['choice']['term'], limit: 6, offset: 1 }
    #   where nearbys.yelp_id == attraction.yelp_id, offset 1
    # end
    @result = @results.businesses[index] #.first
  end
end
