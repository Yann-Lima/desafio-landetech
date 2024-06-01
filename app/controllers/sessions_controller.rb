class SessionsController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def create
    @recruiter = Recruiter.find_by(email: params[:email])
    if @recruiter&.authenticate(params[:password])
      token = JsonWebToken.encode(recruiter_id: @recruiter.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
