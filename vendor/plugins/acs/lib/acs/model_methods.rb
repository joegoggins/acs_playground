module Acs
  module ModelMethods
    def self.included(base)
      base.class_eval do
        include InstanceMethods
        extend ClassMethods
      end
    end
    module InstanceMethods
      def implements_acs_api?; end;
    end
    module ClassMethods
      # Main point of contact from controller to model
      # where controller params are propogated into the filter criteria
      # for the model search
      def acs_find(*args)
      end
      def implements_acs_api?; end;
    end
  end
end