json.array!(@rawmaterials) do |raw_material|
  json.extract! raw_material, :id, :name
  json.url raw_material_url(raw_material, format: :json)
end
