json.array!(@looms) do |loom|
  json.extract! loom, :id, :reference, :workshop_id
  json.url loom_url(loom, format: :json)
end
