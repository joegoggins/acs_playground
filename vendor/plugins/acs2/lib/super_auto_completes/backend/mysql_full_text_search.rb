class SuperAutoCompletes
  module Backend
    module MysqlFullTextSearch      
      
      def search(q, options = {})
        result_set = User.all.reverse
        render_set(result_set)
      end   
      
      def render_set(result_set)
        results = {}
        result_set.each_with_index do |r, index|
          results[index] = {}
          @super_auto_completer.returns.each do |thing_to_return|
            key = thing_to_return.first
            val = thing_to_return.last
            if(val.is_a? Proc)
              val = val.call(r)
            else
              val = r.send(key)
            end
            results[index][key] = val
          end
        end  
        results      
      end

      class AttributesProxy
        attr_accessor :full_text_index
      end
    end
  end
end
