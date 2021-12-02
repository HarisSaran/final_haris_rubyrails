class ToolsController < ApplicationController
  def index
    # @tools = Tool.includes(:producer_company).all

    @tools  = Tool.page(params[:page])
    # @tools  = Tool.paginate(page: params[:page], per_page: 2)  first gem
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @tools = Tool.where("name LIKE ?", wildcard_search)
  end
end
