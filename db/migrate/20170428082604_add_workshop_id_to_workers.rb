class AddWorkshopIdToWorkers < ActiveRecord::Migration[5.0]
  def change
    add_column :workers, :workshop_id, :integer, index: true
  end
end
