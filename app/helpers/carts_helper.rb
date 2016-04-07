module CartsHelper
	def current_cart
		current_cart_id = session[:cart_id]
		
		if current_cart_id != nil
			@current_cart = Cart.find(current_cart_id)
		else	
		# rescue ActiveRecord::RecordNotFound
			@current_cart = Cart.create
			session[:cart_id] = @current_cart.id
		end
	end

	def products_count
		@cart = current_cart
		count = current_cart.line_items.count
		if count == 0
			return 'empty'
		end
		count
	end
end
