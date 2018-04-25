class CreateRequestMaterialLines < ActiveRecord::Migration[5.0]
  def change
    create_table :request_material_lines do |t|
      t.integer :request_material_id
      t.integer :raw_material_warehouse_id
      t.integer :quantity

      t.timestamps
    end
  end
end
