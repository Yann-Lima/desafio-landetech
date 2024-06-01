require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recruiter = recruiters(:yann)
  end

  test "should create job" do
    post recruiter_jobs_url(@recruiter), params: { job: { title: "New Job", description: "Description", start_date: Date.today, end_date: Date.tomorrow, status: "active", skills: "Ruby", recruiter_id: @recruiter.id } }, as: :json
    assert_response :created
  end
end
