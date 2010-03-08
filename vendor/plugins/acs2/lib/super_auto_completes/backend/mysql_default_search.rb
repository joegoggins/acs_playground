class SuperAutoCompletes
  module Backend
    module MysqlDefaultSearch

        def search(q, options = {})
          limit = options.delete(:limit)
          order = options.delete(:order)

          search_string = columns_to_search.map {|x| "#{x} LIKE :q" }.join(" OR ")
          scoped_search = self.scoped
          
          scoped_search = scoped_search.select(columns_to_search)
          scoped_search = scoped_search.where(search_string, :q => "#{q}%")
          scoped_search = scoped_search.limit(limit) unless limit.blank?
          scoped_search = scoped_search.order(order) unless order.blank?
#           find(:all, :conditions => [search_string, :q => q])                 
          scoped_search
        end 
      
        def columns_to_search
          if search_options.columns_to_search.blank?

            default_columns = self.column_names
            # delete if columns end in _id
            default_columns.delete_if {|x| x.last(3) == "_id" }
            default_columns
          else
            search_options.columns_to_search
          end
        end

        def search_options
          super_auto_completer.attributes
        end

        class AttributesProxy
          attr_accessor :columns_to_search
        end
    end
  end
end
