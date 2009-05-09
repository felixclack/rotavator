require File.dirname(__FILE__) + '/../test_helper'

class UserSessionsControllerTest < ActiveSupport::TestCase
  #setup :activate_authlogic
    
  context "on GET to :new" do
    setup do
      get :new
    end
    
    should_respond_with :success
    should_render_template :new
    should_render_a_form
  end
  
  #context "on POST to :create with valid credentials" do
  #  setup do
  #    @user = Factory(:user)
  #    controller.stub!(:current_user, :return => @user)
  #    controller.stub!(:current_user_session, :return => @new_session)
  #    post :create, {:username => 'felix', :password => 'secret'}
  #  end
  #
  #  should_return_from_session :user_id, "@user.id"
  #  should_redirect_to 'dashboard_url'
  #  should_filter_params :password
  #end
  #
  #context "on POST to :create with invalid credentials" do
  #  setup do
  #    post :create, :username => 'gadder', :password => 'fake'
  #  end
  #
  #  should_respond_with :success
  #  should_render_template :new
  #  should_set_the_flash_to /There was a problem/
  #end
  #
  #logged_in_as :user do
  #  context "on DELETE to :destroy" do
  #    setup { delete :destroy }
  #
  #    should 'log user out' do
  #      session[:user_id].should be(nil)
  #    end
  #
  #    should_redirect_to 'root_url'
  #  end
  #end
end