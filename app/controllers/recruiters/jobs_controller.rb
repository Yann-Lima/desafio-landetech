module Recruiters
  class JobsController < ApplicationController
    before_action :authorize_request

    def create
      @job = current_recruiter.jobs.build(job_params)
      if @job.save
        render json: @job, status: :created
      else
        render json: @job.errors, status: :unprocessable_entity
      end
    end

    private

    def job_params
      params.require(:job).permit(:title, :description, :start_date, :end_date, :status, :skills)
    end
  end
end
