require 'test_helper'

class BusinessOwnersControllerTest < ActionController::TestCase
  setup do
    @business_owner = business_owners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:business_owners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create business_owner" do
    assert_difference('BusinessOwner.count') do
      post :create, business_owner: { business_id: @business_owner.business_id, owner_id: @business_owner.owner_id }
    end

    assert_redirected_to business_owner_path(assigns(:business_owner))
  end

  test "should show business_owner" do
    get :show, id: @business_owner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @business_owner
    assert_response :success
  end

  test "should update business_owner" do
    patch :update, id: @business_owner, business_owner: { business_id: @business_owner.business_id, owner_id: @business_owner.owner_id }
    assert_redirected_to business_owner_path(assigns(:business_owner))
  end

  test "should destroy business_owner" do
    assert_difference('BusinessOwner.count', -1) do
      delete :destroy, id: @business_owner
    end

    assert_redirected_to business_owners_path
  end
end
