ActionController::Routing::Routes.draw do |map|
  map.namespace :poc1 do |poc1|
    poc1.resources :dogs, :controller => 'dogs'
    
    poc1.namespace :acs do |acs|
      acs.resources :dogs,
        :only => [:index],
        :name_prefix => 'acs_jqb_for_',
        :path_prefix => 'acs/jqb',
        :controller => "jqb/dogs",
        :collection => {
          :widget => :get,
          :interface => :get,   
          :from_keys => :get,
          :proxy => :get,
          :js_includes => :get
        }
      end
    end
  
  map.root :controller => 'main'
#  map.resources :things
  # 
  #   map.exposes_acs_api "acs_example1",
  #     :controller => "things", 
  #     :action => "jquery_basic", 
  #     :client => 'jquery_basic' # NOT-IMPLEMENTED Refers to a acc_client plugin at vendor/plugins/acc_<CLIENT_NAME>
end
