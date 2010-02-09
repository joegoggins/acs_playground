require 'acs'
require 'acc'
ActionController::Routing::RouteSet::Mapper.send :include, Acs::RouteHelpers
ActiveRecord::Base.send :include, Acs::ModelHelpers