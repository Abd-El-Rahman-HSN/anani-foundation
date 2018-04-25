class AddStatusToRequestMaterials < ActiveRecord::Migration[5.0]
  def change
    add_column :request_materials, :status, :integer, default: 0
  end
end
