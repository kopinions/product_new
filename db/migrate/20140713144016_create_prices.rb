class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :amount
      t.timestamp :effect_date
      t.integer :product_id
      t.timestamps
    end
  end
end
