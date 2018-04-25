class AddSedaToCarpetDatas < ActiveRecord::Migration[5.0]
  def change
    add_column :carpet_data, :seda, :string
  end
end
