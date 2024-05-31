class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: [:login]

  def login
    @recruiter = Recruiter.find_by(email: params[:email])
    if @recruiter&.authenticate(params[:password])
      token = encode_token({ recruiter_id: @recruiter.id })
      render json: { token: token }, status: :ok
    else
      render json: { errors: 'Unauthorized' }, status: :unauthorized
    end
  end

  private

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
