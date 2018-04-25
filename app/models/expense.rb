class Expense < ApplicationRecord
	belongs_to :workshop

	validates_presence_of :kind, :amount, :workshop_id
end
