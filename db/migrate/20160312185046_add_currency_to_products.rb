class AddCurrencyToProducts < ActiveRecord::Migration
  def change
    add_column :products, :currency, :integer
  end
end
