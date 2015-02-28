require 'test_helper'

class BusinessesControllerTest < ActionController::TestCase
  setup do
    @business = businesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:businesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create business" do
    assert_difference('Business.count') do
      post :create, business: { address_city: @business.address_city, address_state: @business.address_state, address_street: @business.address_street, address_zip: @business.address_zip, description: @business.description, email: @business.email, facebook_link: @business.facebook_link, google_plus_link: @business.google_plus_link, name: @business.name, phone_number: @business.phone_number, pinterest_link: @business.pinterest_link, twitter_link: @business.twitter_link, website_url: @business.website_url }
    end

    assert_redirected_to business_path(assigns(:business))
  end

  test "should show business" do
    get :show, id: @business
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @business
    assert_response :success
  end

  test "should update business" do
    patch :update, id: @business, business: { address_city: @business.address_city, address_state: @business.address_state, address_street: @business.address_street, address_zip: @business.address_zip, description: @business.description, email: @business.email, facebook_link: @business.facebook_link, google_plus_link: @business.google_plus_link, name: @business.name, phone_number: @business.phone_number, pinterest_link: @business.pinterest_link, twitter_link: @business.twitter_link, website_url: @business.website_url }
    assert_redirected_to business_path(assigns(:business))
  end

  test "should destroy business" do
    assert_difference('Business.count', -1) do
      delete :destroy, id: @business
    end

    assert_redirected_to businesses_path
  end
end
