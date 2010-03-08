class SuperAutoCompletes
  module ActiveModelExtensions
    
    def super_auto_completes(&block)
      instantiating_class = self
      @super_auto_completer = SuperAutoCompletes.new(instantiating_class)  

      yield @super_auto_completer if block_given?

      extend ClassAdditions
      extend @super_auto_completer.backend
    end
    
    module ClassAdditions
      def super_auto_completer
        @super_auto_completer
      end
    end

  end
end
