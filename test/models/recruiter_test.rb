require 'test_helper'

class RecruiterTest < ActiveSupport::TestCase
  test "should not save recruiter without name" do
    recruiter = Recruiter.new(email: "test@example.com", password: "password")
    assert_not recruiter.save, "Saved the recruiter without a name"
  end
end
