require File.dirname(__FILE__) + '/../test_helper'
require 'participations_controller'

# Re-raise errors caught by the controller.
class ParticipationsController; def rescue_action(e) raise e end; end

class ParticipationsControllerTest < ActionController::TestCase
  fixtures :participations

  def setup
    @controller = ParticipationsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:participations)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_participation
    old_count = Participation.count
    post :create, :participation => { }
    assert_equal old_count + 1, Participation.count

    assert_redirected_to participation_path(assigns(:participation))
  end

  def test_should_show_participation
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end

  def test_should_update_participation
    put :update, :id => 1, :participation => { }
    assert_redirected_to participation_path(assigns(:participation))
  end

  def test_should_destroy_participation
    old_count = Participation.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Participation.count

    assert_redirected_to participations_path
  end
end
