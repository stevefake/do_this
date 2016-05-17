class BoredsController < ApplicationController
  before_action :set_bored, only: [:show, :edit, :update, :destroy]

  begin
    client = Yelp::client
    yelp_places_burst = client.search('lahore , pakistan')
  rescue Yelp::Error::UnavailableForLocation => e
    puts e.message
  end

  # GET /boreds
  # GET /boreds.json
  def index
    if params[:geolocation].present?       #call this :attractions ? :geolocation ? for me it's not a search but a geolocation
      @boreds = Bored.near(params[:geolocation], 1)
    else
      @boreds = Bored.all
    end
  end

  def geolocation
    city = request.location.city
    country = request.location.country_code
    parameters = { geoSuccess: params[:geoSuccess], limit: 3 }
    render json: Yelp.client.search('attractions', parameters)
  end
  def search
    parameters = { term: params[:term], limit: 5 }
    render json: Yelp.client.search('Washington DC', parameters)
  end
  def reviews
    response = Yelp.client.search(‘San Francisco’)
    response.businesses[0].rating
  end

  def yelp
    @yelp = Yelp.client.search('San Francisco', { term: 'food' })

    # current_user.zip_code.present? ? @zip = current_user.zip_code : @zip = "94101"
    # parameters = { term: 'auto repair', limit: 9 }
    # @search = client.search(@zip, parameters)
    # @geopoint = Yelp::Review::Request::GeoPoint
    # render json: Yelp::Review::Request::GeoPoint
  end


  # def search
  #   parameters = { term: params['?q=attractions'], limit: 10 } #display only one tho and user can swipe thru for the rest
  #   render json: Yelp.client.search('Shake Shack', parameters)
  # end

  def show
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Yelp.client.search('Washington DC', parameters) }
    end
  end
  # <% if business.respond_to?(:image_url) %>
  #   <p><%= image_tag business.image_url %></p>
  # <% end %>

  # def name
  #   params[:name]
  # end
  # "Welcome <%= params["name"] %>"


  # def lorem
  #   params[:type]
  # end
  # <% type = params[:type] %>
  #   <% if type == "standard" %>
      # <% end %>





  # GET /boreds
  # GET /boreds.json
  # def index
  #   @boreds = Bored.all
  #
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @boreds }
  #   end
  # end

  # GET /boreds/1
  # GET /boreds/1.json
  # def show
  #   respond_to do |format|
  #     parameters = { term: params[:term], limit: 1 }
  #     format.html # show.html.erb
  #     format.json { render json: Yelp.client.search('Shake Shack', parameters) }
  #     # format.json { render json: @bored }
  #   end
  # end

  # GET /boreds/new
  def new
    @bored = Bored.new
  end

  # GET /boreds/1/edit
  def edit
  end

  # POST /boreds
  # POST /boreds.json
  def create
    @bored = Bored.new(bored_params)

    respond_to do |format|
      if @bored.save
        format.html { redirect_to @bored, notice: 'Bored was successfully created.' }
        format.json { render json: @bored, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @bored.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boreds/1
  # PATCH/PUT /boreds/1.json
  def update
    respond_to do |format|
      if @bored.update(bored_params)
        format.html { redirect_to @bored, notice: 'Bored was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bored.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boreds/1
  # DELETE /boreds/1.json
  def destroy
    @bored.destroy
    respond_to do |format|
      format.html { redirect_to boreds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bored
      @bored = Bored.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bored_params
      params.require(:bored).permit(:name, :rating, :reviews_count, :image_url, :snippet_text, :location, :yelp_id)
    end

    def client
       @client ||= Yelp::Client.new({ consumer_key: ENV['config.consumer_key'],
        consumer_secret: ENV['config.consumer_secret'],
        token: ENV['config.token'],
        token_secret: ENV['config.token_secret']
      })
    end

end
