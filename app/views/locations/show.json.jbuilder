json.(@location, :created_at, :updated_at)

json.workshops @location.workshops.accessible_by(current_ability) do |workshop|
  json.id workshop.id
  json.name workshop.name
end

