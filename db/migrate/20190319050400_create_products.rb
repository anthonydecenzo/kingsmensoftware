class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.int :UserId
      t.string :Name
      t.string :Description
      t.int :Quantity
      t.double :Price

      t.timestamps
    end
  end
end
