class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :kind
      t.float :amount, precision: 7, scale: 2
      t.date :date
      t.integer :workshop_id, index: true

      t.timestamps
    end
  end
end
