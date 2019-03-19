class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :SellerId
      t.integer :ProductId
      t.integer :Quantity
      t.boolean :Notified

      t.timestamps
    end
  end
end
