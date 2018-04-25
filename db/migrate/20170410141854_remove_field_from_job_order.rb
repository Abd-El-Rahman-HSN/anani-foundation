class RemoveFieldFromJobOrder < ActiveRecord::Migration[5.0]
  def up
    remove_column :job_orders, :carpet_datum_id
    add_column :job_orders, :carpet_name, :string
  end

  def down
    add_column :job_orders, :carpet_datum_id, :integer
    remove_column :job_orders, :carpet_name

  end
end
