class CreateDailyProductionInputs < ActiveRecord::Migration[5.0]
  def up
    create_table :daily_production_inputs do |t|
      t.integer :serial
      t.date    :date
      t.integer :number_of_row
      t.integer :numrefpart
      t.integer :totalrefpart
      t.integer :prevproduc
      t.integer :curproduc

      t.timestamps
    end
  end
  def down
  	drop_table :daily_production_inputs
  end
end
