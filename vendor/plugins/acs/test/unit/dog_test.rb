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
  
  test "raises exception if :q or :ids isn't specified" do
    assert_raise Acs::QOrKRequired do
      Dog.acs_find()
    end
    assert_raise Acs::DoubleQuery do
      Dog.acs_find({:q => 'bla', :k => '123'})
    end
  end
end
