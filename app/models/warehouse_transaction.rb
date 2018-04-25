class WarehouseTransaction < ApplicationRecord
	WAREHOUSE_TRANSACTION_NO_INITIAL='1'
	
	belongs_to :supplier
	belongs_to :request_material, optional: true
	has_many :warehouse_transaction_lines, dependent: :destroy
  accepts_nested_attributes_for :warehouse_transaction_lines, :allow_destroy => true

	after_create :check_request_material
	after_update :check_request_material

  after_create :update_status_job_order

  enum status: [:add, :release]

  def self.assign_serial
		code_no = WarehouseTransaction.last.present? ? WarehouseTransaction.pluck(:serial).compact.max.next : "TR" + WAREHOUSE_TRANSACTION_NO_INITIAL
		return code_no.to_s
	end

	def update_status_job_order
		if status == 'release'
			job_order = JobOrder.find(request_material.job_order_id)
			if warehouse_transaction_lines.pluck(:quantity).reduce(:+) > 0 
				job_order.update_under_production
			end
		end
	end	

	def check_request_material
		if warehouse_transaction_lines.collect(&:required_quantity) == warehouse_transaction_lines.collect(&:quantity)
			request_material = RequestMaterial.find(request_material_id)
			request_material.close_request
		end
	end
end
