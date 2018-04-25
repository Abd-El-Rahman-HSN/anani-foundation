class AddStatusToJobOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :job_orders, :status, :integer, default: 0
    remove_column :job_order_workers, :status
    add_column :job_order_workers, :status, :integer, default: 0
  end
end
