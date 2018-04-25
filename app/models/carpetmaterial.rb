class Carpetmaterial < ApplicationRecord
	belongs_to :carpet_datum
	belongs_to :raw_material_warehouse
end
