class CompaniesController < ApplicationController
  respond_to :json

  def get
   _id = params[:_id]
   @company = Company.all[0]
   render :json => @company, :include => [:departments], :methods => [:total]
  end

  def delete
    _id = params[:_id]
   @company = Company.find(_id)
   @company.delete()
   render :json => {:success => true}
  end

  def total
    @company = Company.all[0]
    render :json => @company.total

  end

end
