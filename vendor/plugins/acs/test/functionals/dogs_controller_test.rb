require 'test_helper'

class DogsControllerTest < ActionController::TestCase
  test "api check methods" do
    assert DogsController.respond_to? :exposes_acs_api?
  end
end
