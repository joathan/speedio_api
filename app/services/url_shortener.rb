# Url Shortener
class UrlShortener
  def self.shorten(long_url, user: nil)
    ShortUrl.generate(long_url)
  end
end
