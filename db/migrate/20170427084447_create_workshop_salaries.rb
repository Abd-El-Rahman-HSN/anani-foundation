class CreateWorkshopSalaries < ActiveRecord::Migration[5.0]
  def change
    create_table :workshop_salaries do |t|
      t.date :date
      t.integer :workshop_id
      t.integer :location_id

      t.timestamps
    end
  end
end
