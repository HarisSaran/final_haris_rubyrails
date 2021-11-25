class ToolsController < ApplicationController
  def index
    # @tools = Tool.includes(:producer_company).all
    @tools  = Tool.paginate(page: params[:page], per_page: 2)
  end

  def show
    @tool = Tool.find(params[:id])
  end
end
