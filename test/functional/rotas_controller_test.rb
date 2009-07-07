require File.dirname(__FILE__) + '/../test_helper'

class RotasControllerTest < ActionController::TestCase
  context "on GET :index" do
    setup do
      get :index
    end

    should_respond_with :success
      
  end
  
  context "on GET :new" do
    setup do
      get :new
    end

    should_respond_with :success
    
  end
  
  
end
