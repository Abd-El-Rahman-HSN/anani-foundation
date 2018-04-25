class CreateInvoicePaymentScheduels < ActiveRecord::Migration[5.0]
  def change
    create_table :invoice_payment_scheduels do |t|
      t.decimal :amount
      t.date :due_from
      t.date :due_after

      t.timestamps
    end
  end
end
