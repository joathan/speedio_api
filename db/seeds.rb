puts 'Criando base...'
150.times.each { |s| UrlShortener.shorten("http://meusite#{s}.com.br") }

ShortUrl.all.each do |url|
  url.update(hits: rand(999))
end
puts '[Ok] Base foi criada...'
