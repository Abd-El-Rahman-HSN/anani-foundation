class CreateCarpetmaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :carpetmaterials do |t|
      t.integer :carpet_id
      t.integer :raw_material_id
      t.integer :quantity

      t.timestamps
    end
  end
end
