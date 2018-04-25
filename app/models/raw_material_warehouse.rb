class RawMaterialWarehouse < ApplicationRecord
	validates_presence_of :item, :uom, :category
	has_many :carpetmaterials
  has_many :carpet_data, through: :carpetmaterials
  belongs_to :job_order, optional: true
  belongs_to :supplier


	has_many :job_order_raw_materials
	has_many :job_orders, through: :job_order_raw_materials
  accepts_nested_attributes_for :job_order_raw_materials, :reject_if => :all_blank, :allow_destroy => true

  extend Enumerize
    enumerize :uom, in: [:kgm, :gm]
end
