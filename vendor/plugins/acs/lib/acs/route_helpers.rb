module Acs
  module RouteHelpers
    def self.included(base)
      base.class_eval do
        def exposes_acs_api(*args)
          options = args.extract_options!
          raise "Must specify :controller" if options[:controller].blank?
          begin
            cont_klass_name = "#{options[:controller].classify.pluralize}Controller"
            cont_klass = cont_klass_name.constantize
          rescue NameError => e
            raise "could not find a controller named #{cont_klass_name}."
          end
        end
      end
    end
  end
end