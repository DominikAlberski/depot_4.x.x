require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'add_product should add product to Cart' do
    omally_cart = Cart.create
    omally_cart.add_product(products(:ruby).id).save!
    omally_cart.add_product(products(:rails).id).save!
    assert_equal(2, omally_cart.line_items.size)
  end

  test 'add_product should change quantity in line_items when adding the same product' do
    omally_cart = Cart.create
    omally_cart.add_product(products(:ruby).id).save!
    assert_equal(1, omally_cart.line_items.first.quantity)
    omally_cart.add_product(products(:ruby).id).save!
    assert_equal(2, omally_cart.line_items.first.quantity)
  end

  test 'when adding products price should be calculated' do
    omally_cart = Cart.create
    omally_cart.add_product(products(:ruby).id).save!
    assert_equal(49.99, omally_cart.line_items.first.price)
    omally_cart.add_product(products(:ruby).id).save!
    assert_equal(99.98, omally_cart.line_items.first.price)
    omally_cart.add_product(products(:rails).id).save!
    assert_equal(129.97, omally_cart.total_price)
  end
end
