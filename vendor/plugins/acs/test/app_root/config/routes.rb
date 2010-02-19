ActionController::Routing::Routes.draw do |map|
  map.exposes_acs_api "acs_example1",
    :controller => "dogs",
    :action => "acs_example1", 
    :client => 'jquery_basic' # NOT-IMPLEMENTED Refers to a acc_client plugin at vendor/plugins/acc_<CLIENT_NAME>
  
end
