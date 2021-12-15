# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
900.times.each {|s| UrlShortener.shorten("http://meusite#{s}.com.br")}

ShortUrl.all.each do |url|
  url.update(hits: rand(999))
end