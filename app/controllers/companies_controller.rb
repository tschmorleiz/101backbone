class CompaniesController < ApplicationController
  respond_to :json

  def get
    _id = params[:_id]
    @company = Company.find(_id)
    render :json => @company, :include => [:departments], :methods => [:total]
  end

  def delete
    _id = params[:_id]
    @company = Company.find(_id)
    @company.delete()
    render :json => {:success => true}
  end

  def update
    @company = Company.find_or_create_by(_id: params[:_id])
    @company.update_attributes(params[:company])
    render :json => {:success => true}
  end

end
