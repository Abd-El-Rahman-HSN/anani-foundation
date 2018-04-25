class ChangeCarpetFieldsFloat < ActiveRecord::Migration[5.0]
  def change
  	change_column :carpet_data, :width, :float, precision: 7, scale: 2
  	change_column :carpet_data, :length, :float, precision: 7, scale: 2
  end
end
