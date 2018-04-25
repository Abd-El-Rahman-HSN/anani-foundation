class ReceiveGroupLine < ApplicationRecord
	belongs_to :job_order
	belongs_to :receive_group

  validates_presence_of :job_order_id, :cost

end
