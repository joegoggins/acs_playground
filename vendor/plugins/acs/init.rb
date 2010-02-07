require 'acs'
ActionController::Routing::RouteSet::Mapper.send :include, Acs::RouteHelpers
ActiveRecord::Base.send :include, Acs::ModelHelpers