ActionController::Routing::Routes.draw do |map|
  map.resources :things

  map.exposes_acs_api "acs_example1",
    :controller => "things", 
    :action => "jquery_basic", 
    :client => 'jquery_basic' # NOT-IMPLEMENTED Refers to a acc_client plugin at vendor/plugins/acc_<CLIENT_NAME>
end
