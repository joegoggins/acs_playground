module Acs
  module RouteHelpers
    def self.included(base)
      base.class_eval do
        def exposes_acs_api(route_name, *args)
          
          # TODO: sanitize and check args before setting to options          
          options = args.extract_options!
                    
          raise "Must specify :controller" if options[:controller].blank?
          raise "Must specify :action" if options[:action].blank?
          begin
            cont_klass_name = "#{options[:controller].classify.pluralize}Controller"
            cont_klass = cont_klass_name.constantize
          rescue NameError => e
            raise "could not find a controller named #{cont_klass_name}."
          end
          if options[:model].blank?
            model_klass_name = cont_klass_name.classify.singularize
          else
          end
          
          begin
            model_klass = model_klass_name.constantize
          rescue NameError => e
            raise "could not find a model named #{model_klass_name}."
          end
          
          # Keep in mind where this code is being executed, on an instance of 
          # ActionController::Routing::Routes.draw do |map|  map
          # map.<THE_NAMED_ROUTE>
          self.send(route_name, 
            "#{route_name}_json/:q", 
            :controller => options[:controller],
            :action => options[:action],
            :conditions => {:method => :post}
          )          
           
          
          # cont_klass.class_eval(<<-EOS, __FILE__, __LINE__)
          #             def #{options[:action]}                 
          #             end
          #           EOS
            
          # Inject the basic API methods into controller class          
          cont_klass.send :include, Acs::ControllerMethods
        end
      end
    end
  end
end