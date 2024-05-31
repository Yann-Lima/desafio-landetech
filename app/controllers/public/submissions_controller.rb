module Public
  class SubmissionsController < ApplicationController
    # POST /public/jobs/:job_id/submissions
    def create
      @job = Job.find(params[:job_id])
      @submission = @job.submissions.build(submission_params)
      if @submission.save
        render json: @submission, status: :created
      else
        render json: @submission.errors, status: :unprocessable_entity
      end
    end

    private

    def submission_params
      params.require(:submission).permit(:name, :email, :mobile_phone, :resume)
    end
  end
end
