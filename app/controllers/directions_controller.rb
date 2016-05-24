class DirectionsController < ApplicationController
  # def show
  # end

  def index
  end

  # def display
  #   @destination_address = Direction.new(direction_params[:destination_address.values])
  # end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def direction_params
      params.require(:direction).permit(:destination_address, :destinationLatLng)
    end

    def client
      @client ||= Yelp::Client.new({ consumer_key: ENV['config.consumer_key'],
        consumer_secret: ENV['config.consumer_secret'],
        token: ENV['config.token'],
        token_secret: ENV['config.token_secret']
      })
    end
end
