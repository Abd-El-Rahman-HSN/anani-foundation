class CreateRawMaterialWarehouses < ActiveRecord::Migration[5.0]
  def change
    create_table :raw_material_warehouses do |t|
      t.integer :code
      t.string :item
      t.text :description
      t.integer :uom
      t.integer :safety_level
      t.string :category

      t.timestamps
    end
  end
end
