module WorkshopSalariesHelper
	def salary_units(month, job_order_worker_id)
		job_order_worker = JobOrderWorker.find(job_order_worker_id)
		carpet = job_order_worker.job_order.carpet_datum
    carpet_name = carpet.name
    carpet_knot = carpet.knot
    carpet_price_hundred = carpet.price_hundred
    daily_production_lines = job_order_worker.get_daily_production_lines(params[:month])
    number_of_rows = daily_production_lines.pluck(:number_of_rows).reduce(:+)
    price_for_rows = (((carpet_knot.to_f||0) * (number_of_rows.to_f||0)) / 100) * (carpet_price_hundred.to_f||0)
    seda_lines = job_order_worker.get_seda_lines(params[:month])
    loom = job_order_worker.job_order.loom
    seda = loom.seda_worker.to_f * seda_lines.count
    rsomat_lines = job_order_worker.get_rsomat_lines(params[:month])
    rsomat = rsomat_lines.pluck(:number_of_rows).compact.reduce(:+).to_f
    total = price_for_rows + seda + rsomat 

    return salary = {
    	carpet_name: carpet_name,
			carpet_knot: carpet_knot,
			carpet_price_hundred: carpet_price_hundred,
			daily_production_lines: daily_production_lines,
			number_of_rows: number_of_rows,
			price_for_rows: price_for_rows,
			seda: seda,
			rsomat: rsomat,
			total: total
    }
	end
end
