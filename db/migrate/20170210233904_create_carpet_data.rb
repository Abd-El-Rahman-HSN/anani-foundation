class CreateCarpetData < ActiveRecord::Migration[5.0]
  def change
    create_table  :carpet_data do |t|
      t.integer   :width
      t.integer   :lenght
      t.integer   :knot
      t.integer   :code
      t.string    :name
      t.string    :main_model
      t.string    :raw_material_name
      t.integer   :raw_material_quantity
      t.integer   :number_of_rows
      t.string    :name_design

      t.timestamps
    end
  end
end
