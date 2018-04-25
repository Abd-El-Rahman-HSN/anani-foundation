class ReceiveGroup < ApplicationRecord
	attr_accessor :date

	belongs_to :send_group
	belongs_to :workshop

	has_many :receive_group_lines, dependent: :destroy
  accepts_nested_attributes_for :receive_group_lines, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :workshop_id

  after_create :check_send_group
  after_destroy :check_send_group_destroy

	def check_send_group
		send_group.close_request
		receive_group_lines.each do |line|
			line.job_order.check_receive
		end
	end

	def check_send_group_destroy
		send_group.close_request
		receive_group_lines.each do |line|
			line.job_order.check_receive
		end
	end
	def calc_area
		if length && width
			length * width
		end
	end

end
