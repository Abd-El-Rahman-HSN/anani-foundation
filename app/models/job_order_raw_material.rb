class JobOrderRawMaterial < ApplicationRecord
	belongs_to :job_order, optional: true
	belongs_to :raw_material_warehouse
end
