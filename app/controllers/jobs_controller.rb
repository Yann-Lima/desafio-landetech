class JobsController < ApplicationController
  before_action :set_job, only: [:show, :update, :destroy]

  # GET /jobs
  def index
    @jobs = Job.all
    render json: @jobs
  end

  # GET /jobs/1
  def show
    @job = Job.find(params[:id])
    render json: @job
  end


  # POST /jobs
  def create
    @job = Job.new(job_params)

    if @job.save
      render json: @job, status: :created, location: @job
    else
      render json: @job.errors, status: :unprocessable_entity
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
    render json: { message: "Vaga excluída com sucesso" }, status: :ok
  end

  # API para listar vagas com status ativo
  def active
    @active_jobs = Job.where(status: 'ativo')
    render json: @active_jobs
  end

  # API para buscar vagas por título, descrição ou habilidades
  def search
    if params[:query].present?
      @jobs = Job.where("title ILIKE ? OR description ILIKE ? OR skills ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @jobs = Job.all
    end
    render json: @jobs
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:title, :description, :start_date, :end_date, :status, :skills, :recruiter_id)
    end
end
