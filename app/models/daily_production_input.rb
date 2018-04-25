class DailyProductionInput < ApplicationRecord
	DAILY_PRODUCTION_NO_INITIAL='1'

  belongs_to :main_designe
	belongs_to :job_order
  has_many :trainees, inverse_of: 'daily_production_input_trainee', class_name: 'DailyProductionLine', foreign_key: "daily_production_input_trainee_id", dependent: :destroy
  accepts_nested_attributes_for :trainees, allow_destroy: true

	has_many :daily_production_lines, inverse_of: 'daily_production_input', foreign_key: "daily_production_input_id", dependent: :destroy
  accepts_nested_attributes_for :daily_production_lines, allow_destroy: true

  validates_uniqueness_of :job_order_id, conditions: -> { where("created_at >= ?", Time.zone.now.beginning_of_day).where(report_kind: :normal) }, message: 'لا يمكن عمل لهذا اليوم'
  validates :job_order_id, uniqueness: { scope: :report_kind, message: "هذا التقرير أنشئ مسبقا" }, unless: :kind_is_normal?
	validates_presence_of :job_order_id, :report_kind

  extend Enumerize
    enumerize :report_kind, in: [:normal, :seda, :rsomat]

	def self.assign_serial
    code_no = DailyProductionInput.last ? DailyProductionInput.pluck(:serial).compact.max.next : DAILY_PRODUCTION_NO_INITIAL 
    return code_no.to_s 
  end

  def kind_is_normal?
    report_kind == 'normal'
  end
end
