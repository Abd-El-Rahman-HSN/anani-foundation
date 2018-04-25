class CreateRequestMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :request_materials do |t|
      t.integer :job_order_id, index: true
      t.string :serial
      t.date :date

      t.timestamps
    end
  end
end
