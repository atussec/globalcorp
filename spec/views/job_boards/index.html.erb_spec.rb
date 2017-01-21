require 'rails_helper'

RSpec.describe "job_boards/index", type: :view do
  before(:each) do
    assign(:job_boards, [
      JobBoard.create!(
        :level => 2
      ),
      JobBoard.create!(
        :level => 2
      )
    ])
  end

  it "renders a list of job_boards" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
