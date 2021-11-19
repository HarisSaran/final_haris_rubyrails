class ToolsController < ApplicationController
  def index
    @tools = Tool.includes(:producer_company).all
  end

  def show
    @tool = Tool.find(params[:id])
  end
end
