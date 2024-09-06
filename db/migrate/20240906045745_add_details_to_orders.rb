class AddDetailsToOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :num_people, :integer
    add_column :orders, :reservation, :date
    add_reference :orders, :status, null: false, foreign_key: true
  end
end
