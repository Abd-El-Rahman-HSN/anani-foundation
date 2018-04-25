class ChangeColumnsInWorkersRawMaterialWarehouses < ActiveRecord::Migration[5.0]
  def change
  	change_column :workers, :rate_unit, :string
  	change_column :raw_material_warehouses, :uom, :string
  end
end
