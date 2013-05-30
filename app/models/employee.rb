class Employee
  include Mongoid::Document

  field :name, type: String
  field :address, type: String
  field :salary, type: Float
  field :kids, type: Array
  belongs_to :department, inverse_of: :eus
  # in case employee is manger
  belongs_to :managed_department, class_name: "Department", inverse_of: :manager
end
