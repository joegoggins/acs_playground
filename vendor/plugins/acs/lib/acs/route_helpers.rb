module Acs
  module RouteHelpers
    def self.included(base)
      base.class_eval do
        def exposes_acs_api(args={})
          # TODO: sanitize and check args before setting to options          
          options = args
                    
          raise "Must specify :controller" if options[:controller].blank?
          raise "Must specify :action" if options[:action].blank?
          begin
            cont_klass_name = "#{options[:controller].classify.pluralize}Controller"
            cont_klass = cont_klass_name.constantize
          rescue NameError => e
            raise "could not find a controller named #{cont_klass_name}."
          end
          
          # TODO: interpolate the :model or get it and validate it from args
          options[:model] = "Dog"
          model_klass_name = options[:model]
          begin
            model_klass = model_klass_name.constantize
          rescue NameError => e
            raise "could not find a model named #{model_klass_name}."
          end
          
    
          # TODO: CONTINUE HERE: SHOULD INJECT SOMETHING LIKE:
          # def jquery_basic
          #             @dogs = Dog.acs_find(params)
          #             respond_to do |format|
          #               format.json {render :partial => 'dogs/acs/jquery_basic'}
          #             end
          #           end
          
          # Inject the action method that JavaScript clients will point at
          #
          cont_klass.class_eval(<<-EOS, __FILE__, __LINE__)
            def #{options[:action]}                 
            end
          EOS
            
          # Inject the basic API methods into controller class          
          cont_klass.send :include, Acs::ControllerMethods
        end
      end
    end
  end
end