json.extract! expense, :id, :kind, :amount, :date, :workshop_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
