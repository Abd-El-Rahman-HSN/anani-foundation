class Location < ApplicationRecord
	has_many :workshops
	has_many :job_orders
end
