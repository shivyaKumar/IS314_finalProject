class User < ApplicationRecord
    has_many :wishlists
    has_many :wishlist_products, through: :wishlists, source: :product
  end
  