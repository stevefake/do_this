class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attractions }
    end
  end

 # GET /attractions/1
 # GET /attractions/1.json
 def show
   @attraction = Attraction.find(params[:id])

   respond_to do |format|
     format.html # show.html.erb
     format.json { render json: @attraction }
   end
 end

  # GET /attractions/new
  def new
    @attraction = Attraction.new
  end

  # GET /attractions/1/edit
  def edit
  end

  # POST /attractions
  # POST /attractions.json
  def create
    @attraction = Attraction.new(attraction_params)

    respond_to do |format|

      if @attraction.save
        format.html { redirect_to @attraction, notice: 'Attraction was successfully saved.' }
        format.json { render json: @attraction, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attractions/1
  # PATCH/PUT /attractions/1.json
  def update
    respond_to do |format|
      if @attraction.update(attraction_params)
        format.html { redirect_to @attraction, notice: 'Attraction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attractions/1
  # DELETE /attractions/1.json
  def destroy
    @attraction = Attraction.find(params[:id])
    @attraction.destroy
    respond_to do |format|
      format.html { redirect_to attractions_url }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def attraction_params
      params.require(:attraction).permit(:yelp_id, :flag, :latitude, :longitude, location: []) #
    end

    def client
       @client ||= Yelp::Client.new({ consumer_key: ENV['config.consumer_key'],
        consumer_secret: ENV['config.consumer_secret'],
        token: ENV['config.token'],
        token_secret: ENV['config.token_secret']
      })
    end
end
