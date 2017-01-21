require 'rails_helper'

RSpec.describe "job_boards/new", type: :view do
  before(:each) do
    assign(:job_board, JobBoard.new(
      :level => 1
    ))
  end

  it "renders new job_board form" do
    render

    assert_select "form[action=?][method=?]", job_boards_path, "post" do

      assert_select "input#job_board_level[name=?]", "job_board[level]"
    end
  end
end
