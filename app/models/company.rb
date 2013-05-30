class Company
  include Mongoid::Document

  field :name, type: String
  has_many :departments

  def total
    @total = 0
    departments.each do |d|
      @total += d.total
    end
    return @total
  end

end
