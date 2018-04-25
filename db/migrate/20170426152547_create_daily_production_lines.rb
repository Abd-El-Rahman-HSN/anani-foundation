class CreateDailyProductionLines < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_production_lines do |t|
      t.integer :worker_id
      t.integer :daily_production_input_id, index: true
      t.integer :number_of_rows

      t.timestamps
    end
  end
end
