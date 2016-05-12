class BoredsController < ApplicationController
  before_action :set_bored, only: [:show, :edit, :update, :destroy]

  def search
    parameters = { term: params[:term], limit: 1 }
    render json: Yelp.client.search('Washington DC', parameters)
  end

  # GET /boreds
  # GET /boreds.json
  def index
    @boreds = Bored.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @boreds }
    end
  end

  # GET /boreds/1
  # GET /boreds/1.json
  def show
    respond_to do |format|
      parameters = { term: params[:term], limit: 1 }
      format.html # show.html.erb
      format.json { render json: Yelp.client.search('Washington DC', parameters) }
      # format.json { render json: @bored }
    end
  end

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
end
