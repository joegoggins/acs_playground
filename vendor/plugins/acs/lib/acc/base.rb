  # CHILD acc clients would inherit from this
class Acc::Base
  def initialize(acs_request)
    @acs_request = acs_request
  end
  def valid?
  end
end