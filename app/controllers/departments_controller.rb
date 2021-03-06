class DepartmentsController < ApplicationController
  respond_to :json

  def get
    _id = params[:_id]
    @department = Department.find(_id)
    render :json => @department, :include => [:company, :department, :manager, :eus, :dus], :methods => [:total]
  end

  def delete
    _id = params[:_id]
    @department = Department.find(_id)
    @department.delete()
    render :json => {:success => true}
  end

  def update
    @department = Department.find_or_create_by(_id: params[:_id])
    @department.update_attributes(params[:department])
    render :json => {:success => true}
  end

end
