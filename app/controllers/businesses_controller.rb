class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]

  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.all
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
    # Get the products tied to this business
    @products = Product.where(business_id: @business.id)
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)
    # Find the owner that's adding this business so we can create the relationship to the owner if this business saves
    owner= Owner.where(id: current_owner.id).first
    
    respond_to do |format|
      if @business.save
        # Create a record in the associative table to join the owner and business that was just added
        @business.business_owners.create(owner: owner)
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.products.destroy_all
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: 'Business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business).permit(:name, :email, :address_street, :address_city, :address_state, :address_zip, :phone_number, :website_url, :description, :facebook_link, :twitter_link, :google_plus_link, :pinterest_link, :biz_image)
    end

    #yelp attempt (copied from Sam's ditto folder/places_controller.rb)
    def yelp_search
    @yelp = Yelp.client.search(params[:location], { term: params[:business] })
    respond_with @yelp
    end

    # from yelp's github page - under responses
    ## search
    # response = client.search('San Francisco')

    # response.businesses
    # # [<Business 1>, <Business 2>, ...]

    # response.businesses[0].name
    # # "Kim Makoi, DC"

    # response.businesses[0].rating
    # # 5.0
end
