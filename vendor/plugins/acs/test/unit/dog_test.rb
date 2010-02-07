require 'test_helper'

class DogTest < ActiveSupport::TestCase
  def setup
    @first_dog = Dog.first
  end
  
  test "responds to api check methods" do
    assert Dog.respond_to? :implements_acs_api?
    assert @first_dog.respond_to? :implements_acs_api?
  end
  
  test "responds to worker methods" do
    assert Dog.respond_to? :acs_find
  end
end
