json.(@workshop, :created_at, :updated_at)

json.workers @workshop.workers do |worker|
  json.id worker.id
  json.name worker.name
end

json.job_orders @workshop.job_orders.finished do |job_order|
  json.id job_order.id
  json.serial job_order.get_serial
end

json.looms @workshop.looms do |loom|
  json.id loom.id
  json.reference loom.reference
end

