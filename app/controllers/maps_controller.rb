# require 'json'
# require 'httparty'
class MapsController < ApplicationController

  def index
  	# @response = HTTParty.get("http://localhost:3000/businesses.json")
  	@businesses = Business.all
    @products = Product.all
  end

  def new
  end

  def show
  end

  def edit
  end
end
