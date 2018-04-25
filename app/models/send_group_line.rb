class SendGroupLine < ApplicationRecord
	belongs_to :send_group
	belongs_to :job_order


	validates_presence_of :job_order_id
  validates :job_order_id, uniqueness: { scope: :send_group_id, message: "لا يمكن تكرار السجادة" }

  after_create :check_job_order_create
  after_update :check_job_order_update
  after_destroy :check_job_order_destroy
end

def check_job_order_create
	job_order.update_status('sent')
end

def check_job_order_update
	last_job_order = JobOrder.find(job_order_id_was)
	last_job_order.update_status('finished')
	job_order.update_status('sent')
end

def check_job_order_destroy
	job_order.update_status('finished')
end


