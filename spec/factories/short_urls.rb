FactoryBot.define do
  factory :short_url do
    sequence(:code) { |i| "code#{i}-#{rand(9999)}" }
    long_url { 'http://joathan.dev.br' }
    shortened_url { "http://joathan.dev.br/#{code}" }
  end

  trait :joathan_me do
    shortened_url { "https://joathan.me/#{code}" }
  end
end
