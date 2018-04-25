class AddLocationRefToWorkshops < ActiveRecord::Migration[5.0]
  def change
    add_reference :workshops, :location, foreign_key: true
  end
end
