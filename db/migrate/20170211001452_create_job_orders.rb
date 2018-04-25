class CreateJobOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :job_orders do |t|
      t.integer :serial
      t.date :date
      t.string :item
      t.integer :workshop
      t.integer :loom
      t.integer :worker

      t.timestamps
    end
  end
end
