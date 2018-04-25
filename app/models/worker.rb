class Worker < ApplicationRecord
	WORKER_NO_INITIAL='1'
	belongs_to :job_order, optional: true
	belongs_to :workshop

	has_many :job_order_workers
	has_many :job_orders, through: :job_order_workers

  has_many :extras
  has_many :reductions

	validates_presence_of :name, :category
	validates_presence_of :workshop_id, :rate_amount, :rate_unit, unless: :is_trainee?

	extend Enumerize
    enumerize :category, in: [:worker, :trainer, :trainee]

	def self.assign_serial(job_order_id)
	 	job_order_request_materials = JobOrder.find(job_order_id).request_materials
	 	code_no = job_order_request_materials.last.present? ? job_order_request_materials.pluck(:serial).compact.max.next : "WR" + REQUEST_MATERIAL_NO_INITIAL
	 	return code_no.to_s
  end

	def self.assign_serial(workshop_id)
    code_no = Worker.where(workshop_id: workshop_id).exists? ? Worker.where(workshop_id: workshop_id).pluck(:code).compact.max.next : WORKER_NO_INITIAL 
    return code_no.to_s 
  end

  def job_order_workers_active
  	job_order_workers.includes(:job_order).where('job_orders.status': [:waiting_materials, :under_production, :finished])
  end

  def is_trainee?
  	category == 'trainee'
  end

  def get_seda_lines(month)
    month = month.to_datetime
    DailyProductionLine.includes(:daily_production_input).where(worker_id: id, 'daily_production_inputs.report_kind': 'seda', 'daily_production_inputs.created_at': month.beginning_of_month..month.end_of_month)
  end

  def trainee_salary(month)
  	diff = month.month - hire_date.month
  	if diff <= 3
  		a = [300, 200, 100]
  		return a[diff]
  	end
  end
end
