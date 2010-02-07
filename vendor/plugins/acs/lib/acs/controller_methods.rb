module Acs
  module ControllerMethods
    def self.included(base)
      base.class_eval do
        # API Check methods
        def self.exposes_acs_api?; end
        def exposes_acs_api?; end
      end
    end
  end
end