class RecruitersController < ApplicationController
  skip_before_action :authorize_request, only: [:create, :index, :show]

  def create
    existing_recruiter = Recruiter.find_by(email: recruiter_params[:email])

    if existing_recruiter
      render json: { error: 'Já existe um recrutador com esse e-mail.' }, status: :unprocessable_entity
    else
      @recruiter = Recruiter.new(recruiter_params)
      if @recruiter.save
        token = JsonWebToken.encode(recruiter_id: @recruiter.id)
        render json: { recruiter: @recruiter, token: token }, status: :created
      else
        render json: { errors: @recruiter.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  def index
    @recruiters = Recruiter.all
    render json: @recruiters
  end

  def show
    @recruiter = Recruiter.find(params[:id])
    render json: @recruiter
  end

  def update
    @recruiter = Recruiter.find(params[:id])
    if @recruiter.update(recruiter_params)
      render json: @recruiter
    else
      render json: @recruiter.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @recruiter = Recruiter.find(params[:id])
    @recruiter.destroy
    head :no_content
  end

  private

  def recruiter_params
    params.require(:recruiter).permit(:name, :email, :password, :password_confirmation)
  end
end
