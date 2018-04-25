class Loom < ApplicationRecord
	  belongs_to :workshop
	  has_many :job_orders
end
