class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number

      t.timestamps null: false
    end

    add_index :orders, :number, unique: true, where: 'number IS NOT NULL'
  end
end
