class CartController < ApplicationController
  # POST /cart
  def create
    # product_id = params[:id]
    # logger.debug("Adding #{product_id} to cart.")
    # tool = Tool.find(product_id)
    # session[:shopping_cart] >> product_id
    # redirect_to root_path

    logger.debug("Adding #{params[:id]} to cart.")
    id = params[:id].to_i
    session[:shopping_cart] << id

    tool = Tool.find(id)
    flash[:notice] = "#{tool.name} was succesfully added to cart! Cheers 🍻"

    redirect_to tools_path
  end

  # DELETE /cart/:id
  def destroy
    # removes params[:id]
    logger.debug("Removing #{params[:id]} to cart.")
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    tool = Tool.find(id)
    flash[:notice] = " #{tool.name} removed from cart."
    redirect_to tools_path
  end
end

# 7 resful routs   index new create show edit update destroy
