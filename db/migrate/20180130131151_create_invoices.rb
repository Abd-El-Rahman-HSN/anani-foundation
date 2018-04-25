class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.integer :invoice_serial
      t.date    :date
      t.string  :customer
      t.integer :phone
      t.string  :item
      t.float   :quantity
      t.float   :unit_price
      t.float   :discount
      t.integer :tax
      t.string  :idnum
      t.string  :name
      t.integer :length
      t.integer :width
      t.integer :space
      t.string  :raw
      t.integer :prmetre
      t.integer :total

      t.timestamps
    end
  end
end
