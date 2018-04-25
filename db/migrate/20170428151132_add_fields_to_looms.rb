class AddFieldsToLooms < ActiveRecord::Migration[5.0]
  def change
    add_column :looms, :seda_worker, :string
    add_column :looms, :seda_trainer, :string
  end
end
