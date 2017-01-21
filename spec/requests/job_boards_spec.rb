require 'rails_helper'

RSpec.describe "JobBoards", type: :request do
  describe "GET /job_boards" do
    it "works! (now write some real specs)" do
      get job_boards_path
      expect(response).to have_http_status(200)
    end
  end
end
