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
  
end
