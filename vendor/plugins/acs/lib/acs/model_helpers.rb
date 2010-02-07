module Acs
  module ModelHelpers
    def self.included(base)
      base.class_eval do
        # For checks like .respond_to? :implements_acs_api?, nothing more
        def self.implements_acs_api?; end;
        def implements_acs_api?; end;
        def self.implements_acs_api(*args)
        end
      end
    end
  end
end