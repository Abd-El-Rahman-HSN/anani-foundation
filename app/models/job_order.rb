class JobOrder < ApplicationRecord
  JOB_ORDER_NO_INITIAL='1'

	belongs_to :workshop
	belongs_to :loom
	belongs_to :production_phase
  belongs_to :location
  has_many :request_materials, dependent: :destroy
  has_many :daily_production_inputs
  has_many :send_group_lines
  has_one :receive_group_line
  has_many :invoice

  has_one :carpet_datum
  accepts_nested_attributes_for :carpet_datum

	has_many :job_order_workers, dependent: :destroy
	has_many :workers, through: :job_order_workers
  accepts_nested_attributes_for :job_order_workers, :reject_if => :all_blank, :allow_destroy => true

	has_many :job_order_raw_materials, dependent: :destroy
	has_many :raw_material_warehouses, through: :job_order_raw_materials
  accepts_nested_attributes_for :job_order_raw_materials, :reject_if => :all_blank, :allow_destroy => true

  enum status: [:under_acceptance, :waiting_materials, :under_production, :finished, :sent, :received]

  validate :job_order_unique_active_worker
  validate :unique_loom
  validates_presence_of :location_id, :workshop_id, :loom_id, :production_phase_id

	def job_order_unique_active_worker
  	worker_array = job_order_workers.pluck(:worker_id)
  	  unless worker_array == worker_array.uniq
        errors.add(:base, 'حقل العامل مطلوب')
      end
  end

  def unique_loom
  	if id
  		this = JobOrder.find(id)
  	end
		if (JobOrder.active.where(loom_id: loom_id) - [this]).count > 0
			errors.add(:loom_id, 'هذا النول فى أمر شغل أخر')
		end
  end

  def update_under_production
    self.update_attribute(:status, 'under_production')
  end

  def self.assign_serial(workshop_id, date)
    code_no = JobOrder.where(workshop_id: workshop_id).exists? ? JobOrder.where(workshop_id: workshop_id).where(created_at: date.beginning_of_year..date.end_of_year).pluck(:serial).compact.max.next : JOB_ORDER_NO_INITIAL 
    return code_no.to_s 
  end

  def check_finish
    rows_finished = DailyProductionLine.includes(:daily_production_input).where('daily_production_inputs.job_order_id': id, 'daily_production_inputs.report_kind': 'normal').pluck(:number_of_rows).compact.reduce(:+) || 0
    if rows_finished == carpet_datum.number_of_rows
      self.update_attribute(:status, 'finished')
      return "finished"
    elsif rows_finished < carpet_datum.number_of_rows && self.status == 'finished'
      self.update_attribute(:status, 'under_production')
      return "under_production"
    end
  end

  def check_receive
    if self.receive_group_line.present?
      self.update_attribute(:status, 'received')
    else
      self.update_attribute(:status, 'sent')
    end
  end

  def to_s
    carpet_datum.name
  end

  def get_serial
    workshop_name = workshop.name
    "#{created_at.year}/#{workshop_name}/#{serial}"
  end

  def update_status(status)
    self.update_attribute :status, status
  end

  scope :active, -> { where(status: [:under_acceptance, :waiting_materials, :under_production]) }
  scope :accepted, -> { where(status: [:waiting_materials, :under_production]) }
  scope :all_accepted, -> { where(status: [:waiting_materials, :under_production, :finished]) }
end