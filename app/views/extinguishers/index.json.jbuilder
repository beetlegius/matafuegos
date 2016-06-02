json.array!(@extinguishers) do |extinguisher|
  json.extract! extinguisher, :id, :kind, :expiration_at, :sector_id
  json.url extinguisher_url(extinguisher, format: :json)
end
