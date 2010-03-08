
class SuperAutoCompletes
  cattr_accessor :default_backend, :route
  attr_accessor :returns, :full_text_index
  
  def self.config(&block)
    load_defaults!
    yield self if block_given?
  end
  
def self.load_defaults!
    self.default_backend = :MysqlDefaultSearch
    self.route = ":model/auto_completer"
  end
  

  def initialize(instantiating_class)
    self.backend = self.class.default_backend
    self.returns = {}
      instantiating_class.column_names.each do |cn|
        self.returns[cn.to_sym] = cn.to_sym
      end
  end
  
  def backend=(be_module)
    @backend = "SuperAutoCompletes::Backend::#{be_module}".constantize
  end
  
  def backend
    @backend
  end

  def attributes
    @attr_proxy ||= @backend::AttributesProxy.new
  end


end
