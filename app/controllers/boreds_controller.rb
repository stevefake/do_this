class BoredsController < ApplicationController
  # before_action :set_bored, only: [:show, :edit, :update, :destroy]

  # GET /boreds
  # GET /boreds.json
  # def index
    # if params[:geolocation].present?       #call this :attractions ? :geolocation ? for me it's not a search but a geolocation
    #   @boreds = Bored.near(params[:geolocation], 1)
    # else
    #   @boreds = Bored.all
    # end
  # end
  def index
    @boreds = Bored.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @boreds }
    end
  end

  # def search
    # parameters = { term: params[:term], limit: 5 }
    # render json: Yelp.client.search('Washington DC', parameters)
  # end

  # def show
  #   session[:coordinates] = {
  #     latitude: (params['latitude'] || session['coordinates']['latitude']).to_f,
  #     longitude: (params['longitude'] || session['coordinates']['longitude']).to_f
  #   }
  #   session[:choice] = { term: params['term'] || session['choice']['term'], limit: 6 }
  #   @results = Yelp.client.search_by_coordinates(session[:coordinates], session[:choice])
  #   index = params[:id].to_i - 1
  #   @result = @results.businesses[index]
  # end
 # GET /boreds/1
 # GET /boreds/1.json
 def show
   @bored = Bored.find(params[:id])

   respond_to do |format|
     format.html # show.html.erb
     format.json { render json: @bored }
   end
 end

  # def name
  #   params[:name]
  # end
  # "Welcome <%= params["name"] %>"

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
        format.html { redirect_to @bored, notice: 'Attraction was successfully saved.' }
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
    # def set_bored
    #   @bored = Bored.find(params[:id])
    # end
    #
    # # Never trust parameters from the scary internet, only allow the white list through.
    def bored_params
      params.require(:bored).permit(:yelp_id, location: []) # :name, :rating, :reviews_count, :image_url, :snippet_text, :location,
    end

    def client
       @client ||= Yelp::Client.new({ consumer_key: ENV['config.consumer_key'],
        consumer_secret: ENV['config.consumer_secret'],
        token: ENV['config.token'],
        token_secret: ENV['config.token_secret']
      })
    end

end
