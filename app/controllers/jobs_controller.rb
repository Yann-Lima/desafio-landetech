class JobsController < ApplicationController
  before_action :set_job, only: [:show, :update, :destroy]
  skip_before_action :authorize_request, only: [:index, :create, :destroy, :update]

  # GET /jobs
  def index
    @jobs = Job.all
    render json: @jobs
  end

  # GET /jobs/1
  def show
    render json: @job
  end

  # POST /jobs
  def create
    recruiter_id = job_params[:recruiter_id]

    unless Recruiter.exists?(recruiter_id)
      render json: { error: 'Não foi localizado nenhum recrutador com este ID.' }, status: :unprocessable_entity
      return
    end

    if recruiter_id_already_exists?(recruiter_id)
      render json: { error: 'O ID do recrutador já está associado a um job existente.' }, status: :unprocessable_entity
    else
      job = Job.new(job_params)
      if job.save
        render json: job, status: :created
      else
        render json: { error: job.errors }, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
    render json: { message: "Job excluído com sucesso" }, status: :ok
  end

  private

  def recruiter_id_already_exists?(recruiter_id)
    Job.exists?(recruiter_id: recruiter_id)
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:title, :description, :start_date, :end_date, :status, :skills, :recruiter_id, :recruiter_id_hidden)
    end
end
