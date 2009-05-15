require File.dirname(__FILE__) + '/../test_helper'
require 'rotas_controller'

# Re-raise errors caught by the controller.
class RotasController; def rescue_action(e) raise e end; end

class RotasControllerTest < ActionController::TestCase
  fixtures :rotas

  def setup
    @controller = RotasController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:rotas)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_rota
    old_count = Rota.count
    post :create, :rota => { }
    assert_equal old_count + 1, Rota.count

    assert_redirected_to rota_path(assigns(:rota))
  end

  def test_should_show_rota
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end

  def test_should_update_rota
    put :update, :id => 1, :rota => { }
    assert_redirected_to rota_path(assigns(:rota))
  end

  def test_should_destroy_rota
    old_count = Rota.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Rota.count

    assert_redirected_to rotas_path
  end
end
