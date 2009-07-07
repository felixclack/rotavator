require File.dirname(__FILE__) + '/../test_helper'

class LocationsControllerTest < ActionController::TestCase
  
  context "on GET to :index" do
    setup do
      get :index
    end
    
    should_respond_with :success
    should_render_template :index
  end
  
  context "on GET to :new" do
    setup do
      get :new
    end

    should_respond_with :success
    should_render_template :new
    should_render_a_form
  end
  
  context "on POST to :create" do
    setup do
      post :create, :location => {:name => "Hartlepool"}
    end

    should_change "Location.count", :by => 1
  end
  
  context "on GET to :show" do
    setup do
      get :show, :id => Factory(:location).id
    end

    should_respond_with :success
    should_render_template :show
    should_assign_to :location, :class => Location, :equals => '@location'
  end
  
  context "on GET to :edit" do
    setup do
      get :edit, :id => 1
    end
    
    should_respond_with :success
    should_render_template :edit
    should_render_a_form
  end
  
  context "on PUT to :update" do
    setup do
      @location = Factory(:location)
      put :update, :id => @location.id, :location => {:name => "Teesside"}
    end

    should_redirect_to "location_path(@location)"
  end
  
  context "on DELETE to :destroy" do
    setup do
      @location = Factory(:location)
      delete :destroy, :id => @location.id
    end

    should_change "Location.count", :by => 1
    should_redirect_to "locations_path"
  end
end
