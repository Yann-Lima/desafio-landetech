require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  test "should not save submission without name" do
    submission = Submission.new(email: "test@example.com", mobile_phone: "123456789", resume: "Lorem ipsum", job_id: 1)
    assert_not submission.save, "Saved the submission without a name"
  end

  test "should not save submission without email" do
    submission = Submission.new(name: "John Doe", mobile_phone: "123456789", resume: "Lorem ipsum", job_id: 1)
    assert_not submission.save, "Saved the submission without an email"
  end

end
