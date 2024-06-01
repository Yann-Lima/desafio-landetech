require 'rails_helper'

RSpec.describe "Recruiters", type: :request do
  describe "POST /recruiters" do
    context "with valid parameters" do
      let(:valid_params) { { recruiter: { name: "Test Recruiter", email: "test@example.com", password: "password" } } }

      it "creates a new recruiter" do
        post "/recruiters", params: valid_params
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)["name"]).to eq("Test Recruiter")
      end
    end

    context "with invalid parameters" do
      let(:invalid_params) { { recruiter: { email: "test@example.com" } } }

      it "returns unprocessable entity status" do
        post "/recruiters", params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
