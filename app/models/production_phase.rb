class ProductionPhase < ApplicationRecord
	PRODUCTION_PHASE_PHASE_NO_INITIAL=1
	has_many :job_orders

	validates_presence_of :main_material

	def self.assign_serial
		code_no = ProductionPhase.last ? ProductionPhase.pluck(:phase_no).compact.max.next : PRODUCTION_PHASE_PHASE_NO_INITIAL
		return code_no.to_s 
	end

	def to_s
		"دورة رقم " + phase_no.to_s + " " + main_material
	end
end
