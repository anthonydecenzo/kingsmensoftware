class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :UserId
      t.string :Name
      t.string :Description
      t.integer :Quantity
      t.decimal :Price

      t.timestamps
    end
  end
end
