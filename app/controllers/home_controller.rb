class HomeController < ApplicationController
  def index
    @tools = Tool.includes(:producer_company)
                 .order("price DESC")
                 .limit(3)
  end
end
