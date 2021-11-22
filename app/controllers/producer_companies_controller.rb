class ProducerCompaniesController < ApplicationController
  def index
    @producer_companies = ProducerCompany.select("producer_companies.*")
                                         .select("COUNT(producer_companies.id) as tool_count")
                                         .left_joins(:tools)
                                         .group("producer_companies.id")
                                         .order("tool_count DESC")
  end

  def show
    @producer_company = ProducerCompany.find(params[:id])
  end
end
