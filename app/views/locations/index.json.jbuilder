json.locations @locations do |location|
  json.id location.id
  json.name location.name
  json.thumbnail location.thumbnail_url
end
