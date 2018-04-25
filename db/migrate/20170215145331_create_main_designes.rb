class CreateMainDesignes < ActiveRecord::Migration[5.0]
  def change
    create_table :main_designes do |t|
      t.integer :design_code
      t.string :name
      t.text :description
      t.integer :refpart
      t.integer :lines
      
      t.timestamps
    end
  end
end
