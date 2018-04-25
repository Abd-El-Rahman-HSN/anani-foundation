class CreateExtras < ActiveRecord::Migration[5.0]
  def change
    create_table :extras do |t|
      t.float :cost, precision: 7, scale: 2
      t.integer :worker_id, index: true
      t.integer :workshop_id, index: true

      t.timestamps
    end
  end
end
