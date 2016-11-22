require 'test_helper'

class ConversorsControllerTest < ActionController::TestCase
  setup do
    @conversor = conversors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conversors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conversor" do
    assert_difference('Conversor.count') do
      post :create, conversor: {  }
    end

    assert_redirected_to conversor_path(assigns(:conversor))
  end

  test "should show conversor" do
    get :show, id: @conversor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conversor
    assert_response :success
  end

  test "should update conversor" do
    patch :update, id: @conversor, conversor: {  }
    assert_redirected_to conversor_path(assigns(:conversor))
  end

  test "should destroy conversor" do
    assert_difference('Conversor.count', -1) do
      delete :destroy, id: @conversor
    end

    assert_redirected_to conversors_path
  end
end
