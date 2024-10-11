class WishlistsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @wishlist_items = current_user.wishlist_products
    end
  
    def create
      @wishlist = current_user.wishlists.new(product_id: params[:product_id])
      if @wishlist.save
        flash[:notice] = "Product added to wishlist successfully!"
      else
        flash[:alert] = "Unable to add product to wishlist."
      end
      redirect_back(fallback_location: root_path)
    end
  
    def destroy
      @wishlist = current_user.wishlists.find_by(product_id: params[:product_id])
      if @wishlist&.destroy
        flash[:notice] = "Product removed from wishlist."
      else
        flash[:alert] = "Unable to remove product from wishlist."
      end
      redirect_back(fallback_location: wishlists_path)
    end
  end
  
