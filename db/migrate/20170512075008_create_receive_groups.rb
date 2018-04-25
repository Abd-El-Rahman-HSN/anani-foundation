class CreateReceiveGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :receive_groups do |t|
      t.integer :workshop_id, index: true
      t.integer :send_group_id, index: true
      t.string :serial
      t.timestamps
    end
  end
end
