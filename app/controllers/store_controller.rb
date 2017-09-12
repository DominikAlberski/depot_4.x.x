class StoreController < ApplicationController
  include VisitCounter, CurrentCart
  before_action :set_visit_counter, :set_cart
  # include CurrentCart
  # before_action :set_cart

  def index
    @products = Product.order(:title)
  end
end
