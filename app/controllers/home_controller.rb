class HomeController < ApplicationController
  respond_to :json, :html

  def index
    # everything happens client-sided
  end

  # reset demo data
  def reset
    Employee.delete_all
    Department.delete_all
    Company.delete_all
    craig = Employee.new(_id: 1, name:"Craig", address:"Redmond", salary:123456, kids: ["Susann", "Horst"])
    erik = Employee.new(name:"Erik", address:"Utrecht", salary:12345)
    ralf = Employee.new(name:"Ralf", address:"Koblenz", salary:1234)
    ray = Employee.new(name:"Ray", address:"Redmond", salary:234567)
    klaus = Employee.new(name:"Klaus", address:"Boston", salary:23456)
    karl = Employee.new(name:"Karl", address:"Riga", salary:2345)
    joe = Employee.new(name:"Joe", address:"Wifi City", salary:2344)
    dev11 = Department.new(name:"Dev1.1", manager: karl, eus: [joe], dus: [])
    dev1 = Department.new(name:"Dev1", manager:klaus, eus: [], dus: [dev11])
    dev = Department.new(name:"Development", manager: ray, eus:[], dus: [dev1])
    res = Department.new(name:"Research", manager: craig, eus: [erik, ralf], dus: [])
    @mega = Company.create(name:"maganalysis", departments: [res, dev])
    res.save
    dev.save
    dev1.save
    dev11.save
    joe.save
    karl.save
    klaus.save
    ray.save
    ralf.save
    erik.save
    craig.save
    respond_with @mega
  end

end
