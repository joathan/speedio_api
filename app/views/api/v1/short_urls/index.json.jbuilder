json.data do
  json.array! @short_urls do |short_url|
    json.id short_url.id
    json.shortened_url short_url.shortened_url
    json.long_url short_url.long_url
    json.visits short_url.hits
  end
end
