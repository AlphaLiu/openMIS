class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :unit
      t.integer :stored_count
      t.decimal :purchase_price, :precision => 8, :scale => 2 
      t.decimal :sell_price, :precision => 8, :scale => 2 

      t.timestamps
    end
  end
end
