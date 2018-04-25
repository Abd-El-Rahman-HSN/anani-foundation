class CreateSendGroupLines < ActiveRecord::Migration[5.0]
  def change
    create_table :send_group_lines do |t|
      t.integer :send_group_id, index: true
      t.integer :job_order_id, index: true

      t.timestamps
    end
  end
end
