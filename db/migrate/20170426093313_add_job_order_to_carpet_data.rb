class AddJobOrderToCarpetData < ActiveRecord::Migration[5.0]
  def change
    add_column :carpet_data, :job_order_id, :integer
    add_column :carpet_data, :price_hundred, :float, precision: 7, scale: 2
    rename_column :carpet_data, :lenght, :length 
  end
end
