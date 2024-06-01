module Public
  class JobsController < ApplicationController
    # Pula a autorização para as ações públicas
    skip_before_action :authorize_request, only: [:index, :show]

    # GET /public/jobs
    def index
      @jobs = Job.where(status: 'active')
      if params[:query].present?
        query = "%#{params[:query]}%"
        @jobs = @jobs.where('title LIKE ? OR description LIKE ? OR skills LIKE ?', query, query, query)
      end
      render json: @jobs
    end

    # GET /public/jobs/:id
    def show
      @job = Job.find(params[:id])
      render json: @job
    end
  end
end
