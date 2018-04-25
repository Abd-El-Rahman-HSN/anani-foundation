class CreateJobOrderRawMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :job_order_raw_materials do |t|
      t.integer :job_order_id
      t.integer :raw_material_warehouse_id

      t.timestamps
    end
  end
end
