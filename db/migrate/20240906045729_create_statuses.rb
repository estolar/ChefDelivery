class CreateStatuses < ActiveRecord::Migration[7.2]
  def change
    create_table :statuses do |t|
      t.string :order_status

      t.timestamps
    end
  end
end
