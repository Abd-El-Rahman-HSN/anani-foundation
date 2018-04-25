class CreateWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :workers do |t|
      t.integer :code
      t.string :name
      t.text :address
      t.string :phone
      t.string :category
      t.integer :rate_unit
      t.integer :rate_amount
      t.string :fired
      t.date :firing_date

      t.timestamps
    end
  end
end
