ActionController::Routing::Routes.draw do |map|
  map.exposes_acs_api :controller => "dogs", :action => 'jquery_basic'
end
