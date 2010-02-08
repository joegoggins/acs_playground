require 'test_helper'

class DogsControllerTest < ActionController::TestCase
  test "api check methods" do
    assert DogsController.respond_to? :exposes_acs_api?
  end
  
  test "dogs controller exposes a dynamically created method" do
    assert @controller.respond_to? :acs_example1
  end
  
  test "gets json from jquery_basic" do
    post :acs_example1, :q => 'gold'
    assert_response :success
  end
end
