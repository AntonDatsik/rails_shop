module CartsHelper
	include ProductsHelper
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

	def products_cost
		valute = "RUR"
		sum = 0
		current_cart.line_items.each do |line_item|
			product = Product.find(line_item.product_id)
			product_currency = product.currency
			currency_conversion_value = 0
			currency_conversion_value = currency_conversion[get_currency_by_int_value[product_currency]]
			sum += product.price * currency_conversion_value
		end
		return sum
	end
end
