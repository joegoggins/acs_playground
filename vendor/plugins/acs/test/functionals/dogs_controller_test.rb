require 'test_helper'

class DogsControllerTest < ActionController::TestCase
  test "api check methods" do
    assert DogsController.respond_to? :exposes_acs_api?
  end
  
  test "dogs controller exposes a dynamically created method" do
    assert @controller.respond_to? :jquery_basic
  end
end
