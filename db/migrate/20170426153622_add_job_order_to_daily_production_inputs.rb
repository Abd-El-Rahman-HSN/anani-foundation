class AddJobOrderToDailyProductionInputs < ActiveRecord::Migration[5.0]
  def change
    add_column :daily_production_inputs, :job_order_id, :integer, index: true
  end
end
