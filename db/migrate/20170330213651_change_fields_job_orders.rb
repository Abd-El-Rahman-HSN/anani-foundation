class ChangeFieldsJobOrders < ActiveRecord::Migration[5.0]
  def up
    change_column :job_orders, :serial, :string
    remove_column :job_orders, :workshop
    remove_column :job_orders, :loom
    remove_column :job_orders, :worker
    add_column :job_orders, :location_id, :integer, index: true, foreign_key: true
    add_column :job_orders, :workshop_id, :integer, index: true, foreign_key: true
    add_column :job_orders, :loom_id, :integer, index: true, foreign_key: true
    add_column :job_orders, :production_phase_id, :integer, index: true, foreign_key: true
    add_column :workers, :job_order_id, :integer, index: true, foreign_key: true
    add_column :raw_material_warehouses, :job_order_id, :integer, index: true, foreign_key: true

  end

  def down
  	add_column :job_orders, :workshop, :integer
    add_column :job_orders, :loom, :integer
    add_column :job_orders, :worker, :integer
    remove_column :job_orders, :location_id
    remove_column :job_orders, :workshop_id
    remove_column :job_orders, :loom_id
    remove_column :job_orders, :production_phase_id
    remove_column :workers, :job_order_id
    remove_column :raw_material_warehouses, :job_order_id
  end
end
