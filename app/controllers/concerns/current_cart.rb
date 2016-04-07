module CurrentCart 
	extend ActiveSupport::Concern

	private
	def set_cart
		current_cart_id = session[:cart_id]
		if current_cart_id != nil
			@current_cart = Cart.find(current_cart_id)
		else	
	# rescue ActiveRecord::RecordNotFound
		@current_cart = Cart.create
		session[:cart_id] = @current_cart.id
		end
	end
end
