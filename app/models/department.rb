class Department
  include Mongoid::Document

  field :name, type: String
  has_many :eus, class_name: "Employee"
  accepts_nested_attributes_for :eus
  has_many :dus, class_name: "Department"
  has_one :manager, class_name: "Employee", inverse_of: :managed_department
  belongs_to :department, inverse_of: :dus
  belongs_to :company


  def total
    @total = manager.salary
    eus.each do |eu|
      @total += eu.salary
    end
    dus.each do |du|
      @total += du.total
    end
    return @total
  end

end
