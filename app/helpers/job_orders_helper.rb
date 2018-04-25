module JobOrdersHelper
	def get_serial(job_order_id)
		job_order = JobOrder.find(job_order_id)
		workshop_name = job_order.workshop.name
		"#{job_order.created_at.year}/#{workshop_name}/#{job_order.serial}"
	end
end
