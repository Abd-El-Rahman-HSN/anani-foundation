class AddStatusToSendGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :send_groups, :status, :integer, default: 0
  end
end
