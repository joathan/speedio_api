# class for exceptions

module ExceptionHandler
  extend ActiveSupport::Concern

  # responsible for AuthenticationError
  class AuthenticationError < StandardError; end
  # responsible missing token
  class MissingToken < StandardError; end
  # responsible invalid token
  class InvalidToken < StandardError; end

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |exception|
      json_response({ message: exception.message }, :not_found)
    end
  end

  private

  def four_twenty_two(exception)
    json_response({ message: exception.message }, :unprocessable_entity)
  end

  def unauthorized_request(exception)
    json_response({ message: exception.message }, :unauthorized)
  end
end
