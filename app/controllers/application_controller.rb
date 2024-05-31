# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  before_action :authorize_request

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JWT.decode(header, Rails.application.secrets.secret_key_base)[0]
      @current_recruiter = Recruiter.find(@decoded["recruiter_id"])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def current_recruiter
    @current_recruiter
  end
end
