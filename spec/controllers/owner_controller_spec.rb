require 'rails_helper'

RSpec.describe OwnersController, type: :controller do
	before(:each) do
    @owner1 = Owner.create(email:"joe@joe.com", first_name: 'Joe', last_name: 'Smith', address_street: '15212 Purche Ave', address_city: 'Gardena', address_state: 'CA', address_zip: 90249, password:'password')
    @owner2 = Owner.create(email:"jane@jane.com", first_name: 'Jane', last_name: 'Smith', address_street: '15219 Purche Ave', address_city: 'Gardena', address_state: 'CA', address_zip: 90249, password:'password')
  end

  describe 'GET #index' do
    before(:each) do
      get :index
    end 
    it "should render the correct page" do 
      expect(response).to render_template :index
    end 
    it "have status code of 200" do 
      expect(response).to have_http_status(200)
    end 
    
    it "assigns @owners to include owners" do 
      expect(assigns(:owners)).to include(@owner1, @owner2)
    end
  end #End index controller tests

  describe "GET #show" do 
    before(:each) do
    	# The {"owner_id" => @owner1.id} fakes a login session
      get(:show, {id: @owner1.id}, {"owner_id" => @owner1.id})
    end

    ####### This is erroring for some reason
    it "should render the correct template" do
      expect(response).to render_template :show
    end

    it "assigns @owner to owner1" do
      expect(assigns(:owner)).to eq(@owner1)
    end 
  end #End show tests

  describe "GET #new" do
    before(:each) do
      get :new
    end
    it "renders the correct page" do 
      expect(response).to render_template :new
    end

    it "makes a new owner" do
      expect(assigns(:owner)).to be_a(Owner)
    end

    it "is not persisted" do
      expect{Owner.new}.to change(Owner, :count).by(0)
    end
  end #End new controller tests

  describe "POST #create" do
    it "persists an owner to the DB" do
      expect{Owner.create(email:"jack@jack.com", first_name: 'Jack', last_name: 'Smith', address_street: '15212 Purche Ave', address_city: 'Gardena', address_state: 'CA', address_zip: 90249, password:'password')}.to change(Owner, :count).by(1)
    end
  end #End create controller tests

  describe "DELETE #destroy" do
    before do
      @test_owner = Owner.create(email:"jill@jill.com", first_name: 'Jill', last_name: 'Smith', address_street: '15212 Purche Ave', address_city: 'Gardena', address_state: 'CA', address_zip: 90249, password:'password')
      get :index
    end

    it "deletes an owner from the DB" do
      expect{delete :destroy, id: @test_owner.id}.to change(Owner, :count).by(-1)
    end

    it "redirects to index page" do
      expect(response).to render_template :index
    end
  end #End destroy controller tests
end

