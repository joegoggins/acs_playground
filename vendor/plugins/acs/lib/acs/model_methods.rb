module Acs
  class QOrKRequired < Exception; end
  class DoubleQuery < Exception; end
  
  # when given an several different data structures,
  # it takes care of the propper
  class Response
    def initialize(params)
    end
  end
  
  class IdsRequest < Request
  end
  class QRequest < Request
  end
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
      def acs_find(params={})
        acs_request = Request.new(params)
      end
      
      # API controller params:
      #         :q    Query, what the user typed                               
      #        OR
      #         :k  Primary Keys
      #           k=Thing|123,Dog|898433-332,Person|994 (clustered style)
      #           OR
      #           k=431,884,332,553
      #         :n    Number (max) of results                                  
      #         :f    Filter, constrain the DB query further in addition to :q,
      #               f=age_above_25,name_begins_with_Ronda%20Nelson           
      #         :t    Tag, those matching:                                     
      #               t=age_above_15,age_below_40
      #       
      
      def implements_acs_api?; end;
    end
  end
end