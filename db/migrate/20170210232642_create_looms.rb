class CreateLooms < ActiveRecord::Migration[5.0]
  def up
    create_table :looms do |t|
      t.integer :reference
      t.references :workshop, foreign_key: true
      t.timestamps
    end
  end
  def down
  	drop_table :looms
  	
  end
end
