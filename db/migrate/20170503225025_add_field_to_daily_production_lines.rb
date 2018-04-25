class AddFieldToDailyProductionLines < ActiveRecord::Migration[5.0]
  def change
    add_column :daily_production_lines, :daily_production_input_trainee_id, :integer, index: true
  end
end
