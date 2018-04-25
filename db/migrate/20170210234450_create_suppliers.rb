class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.string :person
      t.string :person_phone
      t.string :category

      t.timestamps
    end
  end
end
