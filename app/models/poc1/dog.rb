class Poc1::Dog < ActiveRecord::Base
  set_table_name 'poc1_dogs'
  
  def self.acs_config
    {:model => self.class.to_s,
     :primary_keys => %w(id),
     :keys => %w(id),
     :mapping => %w(id name)
    }
  end  
  
end
