require 'rails_helper'

RSpec.describe "jobs/index", type: :view do
  before(:each) do
    assign(:jobs, [
      Job.create!(
        :money => "9.99",
        :time => 2,
        :board => nil
      ),
      Job.create!(
        :money => "9.99",
        :time => 2,
        :board => nil
      )
    ])
  end

  it "renders a list of jobs" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
