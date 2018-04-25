class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :names
      t.integer :lengths
      t.integer :widths
      t.integer :spaces
      t.string :raws
      t.integer :pricemetre
      t.integer :totals
      t.references :invoice, foreign_key: true

      t.timestamps
    end
  end
end
