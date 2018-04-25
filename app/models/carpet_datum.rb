class CarpetDatum < ApplicationRecord
	attr_accessor :area

	has_many :carpetmaterials
	has_many :raw_material_warehouses, through: :carpetmaterials
	belongs_to :job_order

	validates_presence_of :name, :number_of_rows, :knot, :price_hundred
	validates :seda, presence: true, length: { maximum: 5 }
	def calc_area
		if length && width
			length * width
		end
	end

end
