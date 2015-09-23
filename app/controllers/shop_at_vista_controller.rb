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

  def checkout
    if user_signed_in? && current_user.cart.items.present?
      resp=instamojo_login
      resp=instamojo_create_payment_link
      instamojo_schedule_inactivation(JSON.parse(resp.read_body)["link"])
      redirect_to JSON.parse(resp.read_body)["link"]["url"]+current_user.data_for_instamojo
    else
      redirect_to root_path
    end
  end

  def payment_success
    @pars=params
    user=User.find_by_email(@pars["buyer"])
    order=user.cart.to_order
    order.total_amount=@pars["amount"]
    order.order_id=@pars["payment_id"]
    offer_slug=@pars["offer_slug"]
    order.save!
    url = URI.parse("https://www.instamojo.com/api/1.1/links/#{offer_slug}/")
    req = Net::HTTP::Delete.new(url.path)
    req.add_field("X-Api-Key", IMJ_CONFIG["api_key"])
    req.add_field("X-Auth-Token", IMJ_CONFIG["api_token"])
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl=true
    resp=http.request(req)
    user.cart.destroy
    MyMailer.shop_at_vista_success(user,order).deliver
  end

  def payment_complete
    @payment_id=params["payment_id"]
    @status=params["status"]
    @order=Order.find_by_order_id(@payment_id)
  end

  private

  def instamojo_login
    url = URI.parse("https://www.instamojo.com/api/1.1/tokens/")
    req = Net::HTTP::Get.new(url.path)
    req.add_field("X-Api-Key", IMJ_CONFIG["api_key"])
    req.add_field("X-Auth-Token", IMJ_CONFIG["api_token"])
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl=true
    resp=http.request(req)
  end

  def instamojo_create_payment_link
    user=current_user
    url = URI.parse("https://www.instamojo.com/api/1.1/links/")
    req = Net::HTTP::Post.new(url.path)
    req.add_field("X-Api-Key", IMJ_CONFIG["api_key"])
    req.add_field("X-Auth-Token", IMJ_CONFIG["api_token"])
    req.set_form_data({"description"=>"Vista 2015 Payment Link - Supported by Instamojo","base_price"=>user.cart.items.collect(&:price).inject(:+).round(2),"currency"=>"INR","title"=>"Shop At Vista","redirect_url"=>"http://iimb-vista.com/shop_at_vista/payment_complete","webhook_url"=>"http://iimb-vista.com/shop_at_vista/payment_success/"})
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl=true
    resp=http.request(req)
  end

  def instamojo_schedule_inactivation(new_link_resp)
    user=current_user
    user.delay(run_at: 1.minutes.from_now).inactivate_payment_link(new_link_resp["slug"])
  end

end
