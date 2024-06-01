require 'rails_helper'

RSpec.describe Recruiter, type: :model do
  it "is not valid without a name" do
    recruiter = Recruiter.new(name: nil)
    expect(recruiter).to_not be_valid
  end

  it "is valid with a name" do
    recruiter = Recruiter.new(name: "Test Recuiter")
    expect(recruiter).to be_valid
  end
end
