class CreateJobOrderWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :job_order_workers do |t|
      t.integer :job_order_id
      t.integer :worker_id
      t.integer :status

      t.timestamps
    end
  end
end
