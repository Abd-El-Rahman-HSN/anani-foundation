class Reduction < ApplicationRecord
	attr_accessor :date
	
	belongs_to :worker
	belongs_to :workshop

	validates_presence_of :cost, :worker_id, :workshop_id
end
