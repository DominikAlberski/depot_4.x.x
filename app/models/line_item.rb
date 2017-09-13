class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  # after adding price column with proper values to line items this function becomes redundant
  # def total_price
  #   # product.price * quantity
  #   product.price * quantity
  # end
end
