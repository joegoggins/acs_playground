module Acs
  module ModelHelpers
    def self.included(base)
      base.class_eval do
        # For checks like .respond_to? :implements_acs_api?, nothing more
        def self.implements_acs_api(*args)
          include Acs::ModelMethods
        end
      end
    end
  end
end