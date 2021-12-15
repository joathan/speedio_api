# authentication controller
class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  def authenticate
    @user = User.find_by(email: params[:email])

    @auth_token =
      Auth::AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
