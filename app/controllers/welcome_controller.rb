class WelcomeController < ApplicationController

  def index
    # unless session[:coordinates].nil?
    #   session[:coordinates] = {
    #     latitude: (params['latitude'] || session['coordinates']['latitude']).to_f,
    #     longitude: (params['longitude'] || session['coordinates']['longitude']).to_f
    #   }
    #   @nearbys = Attraction.near(session[:coordinates].values)
    #   if @nearbys != '#<ActiveRecord::Relation []>'
    #     @nearbys.each do |yelp_id|
    #       @yelp_id = yelp_id
    #       flash[:notice] = "You are near one of your saved destinations! The Yelp ID is: #{@yelp_id.yelp_id}"
    #     end
    #   end
    # end
  end
end
