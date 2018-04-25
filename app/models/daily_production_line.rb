class DailyProductionLine < ApplicationRecord
	belongs_to :daily_production_input
	belongs_to :daily_production_input_trainee
	belongs_to :worker
	belongs_to :main_designe

	validates_presence_of :worker_id, :number_of_rows

	validates_presence_of :number_of_rows, if: :kind_not_seda?
	validate :check_number_of_rows


	def check_number_of_rows
    count = DailyProductionLine.includes(:daily_production_input).where('daily_production_inputs.job_order_id': daily_production_input.job_order.id, 'daily_production_inputs.report_kind': 'normal' ).pluck(:number_of_rows).reduce(:+) || 0 - self.number_of_rows
  	total_rows_in_carpet = daily_production_input.job_order.carpet_datum.number_of_rows
  	if (count + number_of_rows) > total_rows_in_carpet
  		errors.add(:number_of_rows, "الكمية أكبر من العدد الكلى للخطوط الباقى #{ total_rows_in_carpet - count }")
  	end
  end

	def kind_not_seda?
		if daily_production_input
			daily_production_input.report_kind != 'seda'
		end
 	end
end
