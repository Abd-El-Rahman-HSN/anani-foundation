class AddReportKindToDailyProductionInput < ActiveRecord::Migration[5.0]
  def change
    add_column :daily_production_inputs, :report_kind, :string
  end
end
