require 'test_helper'

class WishlistTest < ActiveSupport::TestCase
  test "should not add duplicate product to wishlist" do
    user = users(:one)
    product = products(:one)
    wishlist = Wishlist.new(user: user, product: product)
    assert wishlist.save

    duplicate_wishlist = Wishlist.new(user: user, product: product)
    assert_not duplicate_wishlist.save, "Saved a duplicate product to wishlist"
  end
end
