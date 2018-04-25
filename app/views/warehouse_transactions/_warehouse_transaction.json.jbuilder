json.extract! warehouse_transaction, :id, :date, :serial, :status, :created_at, :updated_at
json.url warehouse_transaction_url(warehouse_transaction, format: :json)
