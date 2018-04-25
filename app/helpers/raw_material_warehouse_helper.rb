module RawMaterialWarehouseHelper
	def get_available_quantity(raw_material_warehouse_id)
		raw_material = RawMaterialWarehouse.find(raw_material_warehouse_id)
		raw_material.quantity
	end
end
