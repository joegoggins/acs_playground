require 'test_helper'

class Poc1::DogsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:poc1_dogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dog" do
    assert_difference('Poc1::Dog.count') do
      post :create, :dog => { }
    end

    assert_redirected_to dog_path(assigns(:dog))
  end

  test "should show dog" do
    get :show, :id => poc1_dogs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => poc1_dogs(:one).to_param
    assert_response :success
  end

  test "should update dog" do
    put :update, :id => poc1_dogs(:one).to_param, :dog => { }
    assert_redirected_to dog_path(assigns(:dog))
  end

  test "should destroy dog" do
    assert_difference('Poc1::Dog.count', -1) do
      delete :destroy, :id => poc1_dogs(:one).to_param
    end

    assert_redirected_to poc1_dogs_path
  end
end
