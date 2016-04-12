module ProductsHelper
	def currencies_for_select
		currencies = {"USD" => 0, "EUR" => 1, "RUS" => 2}
	end

	def get_currency_by_int_value
		{0 => "USD", 1 => "EUR", 2 => "RUS"}
	end

	def glyphicons_classes
		glyphicons = {0 => "glyphicon-usd", 1 => "glyphicon-euro", 2 => "glyphicon-rub"}
	end

	def currency_conversion
		{"USD" => 60, "EUR" => 90, "RUS" => 1}
	end

	def short_desc description
		if description.length > 70
			description[0..70] << '...'
		else
			description
		end
	end
end
