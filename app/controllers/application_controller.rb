class ApplicationController < ActionController::API
  # Adicione as ações públicas reais aqui no except
  before_action :authorize_request, except: [:index, :show]

  private

  # Método para autorizar a solicitação usando JWT
  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_recruiter = Recruiter.find(@decoded[:recruiter_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  # Método helper para acessar o current_recruiter
  def current_recruiter
    @current_recruiter
  end
end
