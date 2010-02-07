module Acs
  module ModelHelpers
    def self.included(base)
      base.class_eval do
        def complies_with_acs_api(*args)
          options = args.extract_options!
        end
      end
    end
  end
end