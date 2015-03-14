# require 'json'
# require 'httparty'
class MapsController < ApplicationController

  def index
  	# @response = HTTParty.get("http://localhost:3000/businesses.json")
    if params[:location].present?
      @businesses = Business.near(params[:location], 5, :order => "distance")
    else
      @businesses = Business.all
    end
    @products = Product.all

  end

  def new
  end

  def show
  end

  def edit
  end
end
