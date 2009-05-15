require File.dirname(__FILE__) + '/../test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  
  context "on GET to :new" do
    setup do
      get :new
    end
    
    should_respond_with :success
    should_render_template :new
    should_render_a_form
  end
  
  context "on POST to :create with valid credentials" do
    setup do
      @user = Factory(:user)
      User.stub!(:is_waca?, :return => false)
      post :create, {:user_session => {:login => 'felix', :password => 'secret'}}
    end
  
    should_return_from_session :user_credentials_id, "@user.id"
    should_redirect_to 'dashboard_url'
    should_filter_params :password
  end
  
  context "on POST to :create with valid basecamp credentials" do
    setup do
      User.stub!(:is_waca?, :return => true)
      post :create, {:user_session => {:login => 'basecamp_user', :password => "secret"}}
    end

    should_redirect_to 'dashboard_url'
  end
  
  
  context "on POST to :create with invalid credentials" do
    setup do
      User.stub!(:is_waca?, :return => false)
      post :create, :user_session => {:login => 'felix', :password => 'fake'}
    end
  
    should_respond_with :success
    should_render_template :new
  end
  
  context "as a logged in user" do
    
    context "on DELETE to :destroy" do
      setup do
        activate_authlogic
        #controller.session[:user_credentials] = @user.persistence_token
        UserSession.create(Factory(:user))
        delete :destroy
      end
      
      #setup { delete :destroy }
  
      should 'log user out' do
        controller.session[:user_credentials].should be(nil)
      end
  
      should_redirect_to 'root_url'
    end
  end
    
end