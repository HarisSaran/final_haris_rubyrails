class HomeController < ApplicationController
  def index
    @tools = Tool.includes(:producer_company)
                 .order("price DESC")
                 .limit(3)
    @producer_companies = ProducerCompany.select("producer_companies.*")
                                         .select("COUNT(producer_companies.id) as tool_count")
                                         .left_joins(:tools)
                                         .group("producer_companies.id")
                                         .order("tool_count DESC")
                                         .limit(3)
  end
end
