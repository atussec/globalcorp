require 'rails_helper'

RSpec.describe "jobs/new", type: :view do
  before(:each) do
    assign(:job, Job.new(
      :money => "9.99",
      :time => 1,
      :board => nil
    ))
  end

  it "renders new job form" do
    render

    assert_select "form[action=?][method=?]", jobs_path, "post" do

      assert_select "input#job_money[name=?]", "job[money]"

      assert_select "input#job_time[name=?]", "job[time]"

      assert_select "input#job_board_id[name=?]", "job[board_id]"
    end
  end
end
