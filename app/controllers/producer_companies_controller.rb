class ProducerCompaniesController < ApplicationController
  def index
    @producer_companies = ProducerCompany.ordered_by_tools
  end

  def show
    @producer_company = ProducerCompany.find(params[:id])
  end
end
