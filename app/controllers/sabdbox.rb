class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:update, :destroy, :show]
  skip_before_action :authorize_request, only: [:index, :create, :destroy, :update]

  # GET /submissions
  def index
    @submissions = Submission.all
    render json: @submissions
  end

  #GET /submissions/1
  def show
    render json: @submission
  end

  # POST /submissions
  def create
    job_id = submission_params[:job_id]

    unless Job.exists?(job_id) # Aqui estava Jobs.exists?
      render json: { error: 'Não foi localizado nenhum job com este ID.' }, status: :unprocessable_entity
      return
    end

    if job_id_already_exists?(job_id)
      render json: { error: 'O ID do job já está associado a um candidato existente.' }, status: :unprocessable_entity
    else
      submission = Submission.new(submission_params)
      if submission.save
        render json: submission, status: :created
      else
        render json: { error: submission.errors }, status: :unprocessable_entity
      end
    end
  end

  # PUT /submissions/:id
  def update
    if @submission.update(submission_params)
      render json: @submission
    else
      render json: @submission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /submissions/:id
  def destroy
    @submission.destroy
    render json: { message: "Candidato excluído com sucesso" }, status: :ok
  end

  private

  def job_id_already_exists?(job_id)
    Submission.exists?(job_id: job_id)
  end

  def set_submission
    @submission = Submission.find(params[:id])
  end

  def submission_params
    params.require(:submission).permit(:nameCandidato, :emailCandidato, :phoneCandidato, :resumeCandidato, :job_id)
  end
end
