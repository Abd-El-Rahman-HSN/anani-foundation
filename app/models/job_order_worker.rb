class JobOrderWorker < ApplicationRecord
	belongs_to :job_order, optional: true
	belongs_to :worker

  validate :unique_active_worker

  def unique_active_worker
		if JobOrder.joins(:job_order_workers).active.where('job_order_workers.worker_id': worker_id).count > 0
			errors.add(:worker_id, 'هذا العامل فى أمر شغل أخر')
		end
  end

  def get_serial
  	job_order.get_serial
  end

  def get_daily_production_lines(month)
  	month = month.to_datetime
		DailyProductionLine.includes(:daily_production_input).where(worker_id: worker.id, 'daily_production_inputs.report_kind': 'normal', 'daily_production_inputs.created_at': month.beginning_of_month..month.end_of_month)
  end

  def get_seda_lines(month)
    month = month.to_datetime
    DailyProductionLine.includes(:daily_production_input).where(worker_id: worker.id, 'daily_production_inputs.report_kind': 'seda', 'daily_production_inputs.created_at': month.beginning_of_month..month.end_of_month)
  end

  def get_rsomat_lines(month)
    month = month.to_datetime
    DailyProductionLine.includes(:daily_production_input).where(worker_id: worker.id, 'daily_production_inputs.report_kind': 'rsomat', 'daily_production_inputs.created_at': month.beginning_of_month..month.end_of_month)
  end
end


