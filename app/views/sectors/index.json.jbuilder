json.array!(@sectors) do |sector|
  json.extract! sector, :id, :name, :latitude, :longitude
  json.url sector_url(sector, format: :json)
end
