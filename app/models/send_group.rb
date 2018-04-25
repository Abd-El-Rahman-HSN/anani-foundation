class SendGroup < ApplicationRecord
	SEND_GROUP_NO_INITIAL=1
	
	attr_accessor :date

	belongs_to :workshop
  has_one :receive_group

	has_many :send_group_lines, dependent: :destroy
  accepts_nested_attributes_for :send_group_lines, allow_destroy: true


  enum status: [:open, :closed]


  def self.assign_serial(workshop_id)
    code_no = SendGroup.where(workshop_id: workshop_id).exists? ? SendGroup.where(workshop_id: workshop_id).pluck(:serial).compact.max.next : SEND_GROUP_NO_INITIAL 
    return code_no.to_s 
  end

  def close_request
    if self.receive_group.present?
      self.update_attribute :status, 'closed'
    else
      self.update_attribute :status, 'open'
    end
  end
end
