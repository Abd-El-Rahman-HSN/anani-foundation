class RequestMaterial < ApplicationRecord
	REQUEST_MATERIAL_NO_INITIAL='1'
	attr_accessor :job_order_serial

	belongs_to :job_order, optional: true
	has_many :warehouse_transactions, dependent: :destroy

	has_many :request_material_lines, dependent: :destroy
  accepts_nested_attributes_for :request_material_lines, :reject_if => :all_blank, :allow_destroy => true
	
	enum status: [:open, :closed]

	def self.assign_serial(job_order_id)
		job_order_request_materials = JobOrder.find(job_order_id).request_materials
		code_no = job_order_request_materials.last.present? ? job_order_request_materials.pluck(:serial).compact.max.next : "WR" + REQUEST_MATERIAL_NO_INITIAL
		return code_no.to_s
	end

	def close_request
		self.update_attribute(:status, 'closed')
	end
end
