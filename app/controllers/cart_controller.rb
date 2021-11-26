class CartController < ApplicationController
  # POST /cart
  def create
    logger.debug("Adding #{params[:id]} to cart.")
  end

  # DELETE /cart/:id
  def destroy
    # removes params[:id]
  end
end

# 7 resful routs   index new create show edit update destroy
