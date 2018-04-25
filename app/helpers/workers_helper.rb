module WorkersHelper
	def daily_production_trainees_for_workshop(workshop_id, month)
  	daily_lines_trainees = []
  	DailyProductionInput.includes(:job_order).where('job_orders.workshop_id': workshop_id, report_kind: 'normal', created_at: month.beginning_of_month..month.end_of_month).joins(:trainees).each do |daily_input|
  		daily_lines_trainees += daily_input.trainees
  	end
  	daily_lines = { workers: daily_lines_trainees.pluck(:worker_id), rows: daily_lines_trainees.pluck(:number_of_rows) }
  	
  	return daily_lines
  end
end
