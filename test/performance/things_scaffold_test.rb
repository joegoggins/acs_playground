require 'test_helper'
require 'performance_test_help'

class ThingsScaffoldTest < ActionController::PerformanceTest
  # Replace this with your real tests.
  def test_homepage
    get '/things'
  end
  
  test "" do
    get '/things/new'
  end
end
