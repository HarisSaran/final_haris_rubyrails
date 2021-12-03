class ToolsController < ApplicationController
  def index
    # @tools = Tool.includes(:producer_company).all

    @tools  = Tool.page(params[:page])
    # @tools  = Tool.paginate(page: params[:page], per_page: 2)  first gem
  end

  def show
    @tool = Tool.find(params[:id])
  end

  # def search
  #   wildcard_search = "%#{params[:keywords]}%"
  #   @tools = Tool.where("name LIKE ?", wildcard_search)
  # end

  def search
    # @tools = if !params[:id].empty?
    #            Tool.joins(:tool_types).where(tool_types: { id: params[:id] }).where(
    #              "name OR description LIKE ?", "%#{params[:search_term]}%"
    #            )
    @tools = if !params[:id].empty?
               Tool.where("producer_company_id = #{params[:id]}").where(
                 "name OR description LIKE ?", "%#{params[:search_term]}%"
               )

             else
               #   wildcard_search = "%#{params[:keywords]}%"
               # @tools = Tool.where("name LIKE ?", wildcard_search)
               Tool.where("name OR description LIKE ?", "%#{params[:search_term]}%")
             end
  end
end
