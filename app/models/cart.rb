class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  before_destroy :ensure_not_referenced_by_any_line_item

  def add_product(product_id)
    product = Product.find(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
      current_item.price += product.price
    else
      current_item = line_items.build(product_id: product_id)
      current_item.price = product.price
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.price }
  end

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      true
    else
      errors.add(:base, 'Line Items present')
      false
    end
  end
end
