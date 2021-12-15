class ShortUrl < ApplicationRecord
  DOMAIN = ENV.fetch('SHORT_URL_DOMAIN', 'http://joathan.dev.br')

  belongs_to :user, optional: true

  validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :shortened_url, presence: true
  validates :long_url, presence: true

  scope :top, ->(top) { limit(top).order('hits DESC') }
  scope :short, -> { where("shortened_url LIKE 'http://joathan.dev.br/%'") }

  def self.generate(long_url)
    return unless long_url

    short_url = ShortUrl.new(long_url: long_url)

    loop do
      short_url.code = TokenGenerator.validation_code(3)
      short_url.shortened_url = "#{DOMAIN}/#{short_url.code}"
      break if short_url.save
    end

    short_url
  end

  def to_s
    shortened_url
  end
end
