class IndexAssociateColumns < ActiveRecord::Migration[5.0]
  def change
  	add_index :carpetmaterials, :carpet_id
  	add_index :carpetmaterials, :raw_material_id
  end
end
