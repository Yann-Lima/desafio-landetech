test "should return true if job is active" do
  job = Job.new(title: "Software Engineer", description: "Description", status: "active")
  assert job.active?, "Job should be active"
end
