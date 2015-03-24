class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number, null: false

      t.timestamps null: false
    end

    add_index :orders, :number, unique: true
  end
end
