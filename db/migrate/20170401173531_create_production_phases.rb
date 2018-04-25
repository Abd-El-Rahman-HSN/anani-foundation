class CreateProductionPhases < ActiveRecord::Migration[5.0]
  def change
    create_table :production_phases do |t|
      t.string :main_material
      t.integer :phase_no
      t.string :initial_letter

      t.timestamps
    end
  end
end
