class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
       t.integer :item_id,null: false
       t.integer :order_id,null: false
       t.integer :purchase_price,null: false
       t.integer :amount,null: false
       t.integer :crafting_status,null: false
      t.timestamps
    end
  end
end
