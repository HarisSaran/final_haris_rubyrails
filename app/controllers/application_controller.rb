class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  helper_method :cms_pages
  def cms_pages
    Page.all
  end

  private

  def initialize_session
    session[:shopping_cart] ||= []
  end

  def cart
    Tool.find(session[:shopping_cart])
  end
end
