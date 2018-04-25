class CreateShowrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :showrooms do |t|
      t.string :name , :null=>false
      t.string :location , :null=>false
      t.text :address , :null=>false
      t.string :person_name , :null=>false
      t.string :person_number , :null=>false

      t.timestamps
    end
  end
end
