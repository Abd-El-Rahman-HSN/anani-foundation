class CreateReceiveGroupLines < ActiveRecord::Migration[5.0]
  def change
    create_table :receive_group_lines do |t|
      t.integer :job_order_id, index: true
      t.integer :receive_group_id, index: true
      t.float :cost, precision: 7, scale: 2
      t.integer :length
      t.integer :width
      t.integer :area
      t.string :note

      t.timestamps
    end
  end
end
