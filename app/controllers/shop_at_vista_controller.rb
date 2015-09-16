class ShopAtVistaController < ApplicationController
	layout "shopatvista"

  def index
    @cart=Cart.find_or_create_by_user_id(current_user.id)
  	@products=Product.all
  end

  def product_info
    @cart=Cart.find_or_create_by_user_id(current_user.id)
  	product_id=params[:id]
  	@product=Product.find_by_id(product_id)
  	@items=@product.items
  end

  def add_to_cart
  	begin
	  	item_id=params[:id]
	  	user_id=params[:cid]
	  	@item=Item.find_by_id(item_id)
	  	@cart=Cart.find_or_create_by_user_id(user_id)
	  	@cart.items<<@item
	rescue Exception => e
		render :text=>"Something went wrong...", :status=>503 and return
	end
	render :text=>"Added to cart successfully" and return
  end

  def remove_from_cart
    begin
      item_id=params[:id]
      user_id=params[:cid]
      @item=Item.find_by_id(item_id)
      @cart=Cart.find_or_create_by_user_id(user_id)
      if @cart.items.include?(@item)
        @cart.items.delete(@item)
      else
        render :text=>"Item not available in your cart. Please refresh the page and try again", :status=>503 and return    
      end
  rescue Exception => e
    render :text=>"Something went wrong...", :status=>503 and return
  end
  render :text=>"Removed from cart successfully" and return
  end
end
