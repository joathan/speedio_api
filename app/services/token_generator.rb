# Generate tokens
class TokenGenerator
  class << self
    CHARACTERS = %w[1 2 3 4 5 6 7 8 9 A B C D E F G H J K L M N P Q R S T U V W X Y Z].freeze

    def validation_code(length)
      Array.new(length) { CHARACTERS.sample }.join
    end
  end
end
