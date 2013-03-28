class CreateOrderItemships < ActiveRecord::Migration
  def change
    create_table :order_itemships do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :count

      t.timestamps
    end
  end
end
