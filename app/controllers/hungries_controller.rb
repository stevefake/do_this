class HungriesController < ApplicationController
  before_action :set_hungry, only: [:show, :edit, :update, :destroy]

  # GET /hungries
  # GET /hungries.json
  def index
    @hungries = Hungry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hungries }
    end
  end

  # GET /hungries/1
  # GET /hungries/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hungry }
    end
  end

  # GET /hungries/new
  def new
    @hungry = Hungry.new
  end

  # GET /hungries/1/edit
  def edit
  end

  # POST /hungries
  # POST /hungries.json
  def create
    @hungry = Hungry.new(hungry_params)

    respond_to do |format|
      if @hungry.save
        format.html { redirect_to @hungry, notice: 'Hungry was successfully created.' }
        format.json { render json: @hungry, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @hungry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hungries/1
  # PATCH/PUT /hungries/1.json
  def update
    respond_to do |format|
      if @hungry.update(hungry_params)
        format.html { redirect_to @hungry, notice: 'Hungry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hungry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hungries/1
  # DELETE /hungries/1.json
  def destroy
    @hungry.destroy
    respond_to do |format|
      format.html { redirect_to hungries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hungry
      @hungry = Hungry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hungry_params
      params.require(:hungry).permit(:name, :rating, :reviews_count, :image_url, :snippet_text, :location, :yelp_id)
    end
end
