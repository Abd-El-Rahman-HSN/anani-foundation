class CreatePurchaseRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_requests do |t|
      t.integer :pr_serial
      t.date :date
      t.string :item
      t.integer :quantity

      t.timestamps
    end
  end
end
