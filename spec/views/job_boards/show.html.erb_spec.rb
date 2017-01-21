require 'rails_helper'

RSpec.describe "job_boards/show", type: :view do
  before(:each) do
    @job_board = assign(:job_board, JobBoard.create!(
      :level => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
