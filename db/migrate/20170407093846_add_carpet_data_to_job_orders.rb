class AddCarpetDataToJobOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :job_orders, :carpet_datum_id, :integer, index: true
  end
end
