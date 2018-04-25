class AddHireDateToWorkers < ActiveRecord::Migration[5.0]
  def change
    add_column :workers, :hire_date, :datetime
  end
end
