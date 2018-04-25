class CreateSendGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :send_groups do |t|
      t.string :serial
      t.integer :workshop_id, index: true

      t.timestamps
    end
  end
end
