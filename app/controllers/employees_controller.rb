class EmployeesController < ApplicationController
  respond_to :json

  def get
    @_id = params[:_id]
    @employee = Employee.find(@_id)
    render :json => @employee, :include => [:managed_department, :department]
  end

  def delete
    @_id = params[:_id]
    @employee = Employee.find(@_id)
    @employee.delete()
    render :json => {:success => true}
  end

  def update
    @employee = Employee.find_or_create_by(_id: params[:_id])
    @employee.update_attributes(params[:employee])
    render :json => {:success => true}
  end

end
