require 'test_helper'

class Public::JobsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_jobs_url
    assert_response :success
  end

  test "should show job" do
    job = jobs(:one)
    get public_job_url(job)
    assert_response :success
  end

end
