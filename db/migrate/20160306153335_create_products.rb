class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :title
      t.string :description
      t.decimal :price
      t.references :user
      t.timestamps
    end
  end
end
