class Workshop < ApplicationRecord
	has_many :looms
	has_many :job_orders
	has_many :workers
	has_many :expenses
  has_many :extras
  has_many :reductions
  has_many :send_groups
  has_many :receive_groups
	belongs_to :location
	belongs_to :user

	validates_presence_of :name, :location_id
end
