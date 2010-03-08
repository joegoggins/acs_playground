class Poc1::Dog < ActiveRecord::Base
  set_table_name 'poc1_dogs'
  
  def self.acs_config
    {:model => self.class.to_s,
     :primary_keys => %w(id),
     :keys => %w(id),
     :mapping => %w(id name)
    }
  end
  
  named_scope :acs_find, lambda {|q| {:conditions => ["name LIKE ?", "#{q}%"]}}

  def to_acs
    {:model => self.class.to_s,
     :name => self.name
    }
  end  
  
  extend SuperAutoCompletes::ActiveModelExtensions

  super_auto_completes do |api|
    api.returns = {:id => :id}

    api.backend = :MysqlDefaultSearch
    api.attributes.columns_to_search = self.column_names
  end

end
