class RequestMaterialLine < ApplicationRecord
	belongs_to :request_material, optional: true
	belongs_to :raw_material_warehouse
	has_many :warehouse_transaction_lines
end
