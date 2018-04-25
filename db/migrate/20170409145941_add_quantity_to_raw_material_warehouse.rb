class AddQuantityToRawMaterialWarehouse < ActiveRecord::Migration[5.0]
  def change
    add_column :raw_material_warehouses, :quantity, :integer, default: 0
  end
end
