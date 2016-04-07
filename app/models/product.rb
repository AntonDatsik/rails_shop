class Product < ActiveRecord::Base
	belongs_to :user
	has_many :line_items

	before_destroy :ensure_not_referenced_by_any_line_item

	validates :description, length: { minimum: 70 }

	private
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			return false
		end
	end
end
