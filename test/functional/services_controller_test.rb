require File.dirname(__FILE__) + '/../test_helper'

# Re-raise errors caught by the controller.
class ServicesController; def rescue_action(e) raise e end; end

class ServicesControllerTest < ActionController::TestCase

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
      post :create, :service => {:start_at => (Time.now + 14.days), :location_id => Factory(:location).id }
    end

    should_change "Service.count", :by => 1
  end
  
  context "on GET to :show" do
    setup do
      @service = Factory(:service)
      get :show, :id => @service.id, :location_id => @service.location.id
    end

    should_respond_with :success
    should_render_template :show
    should_assign_to :service, :class => Service, :equals => '@service'
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
      @service = Factory(:service)
      put :update, :id => @service.id, :service => {:start_at => Time.now + 14.days}
    end

    should_redirect_to "service_path(@service)"
  end
  
  context "on DELETE to :destroy" do
    setup do
      @service = Factory(:service)
      delete :destroy, :id => @service.id
    end

    should_change "Service.count", :by => 1
    should_redirect_to "services_path"
  end
  
end
