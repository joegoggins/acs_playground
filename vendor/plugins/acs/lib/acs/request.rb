class Acs::Request
  attr_accessor :q, :k, :n, :f, :t
  def initialize(params)
    if params[:q].blank? && params[:k].blank?
      raise Acs::QOrKRequired, "You gotta say :q or :k"
    end
    if !params[:q].blank? && !params[:k].blank?
      raise Acs::DoubleQuery, "You have provided a query and ids. Which did you intend?"      
    end
  end
end