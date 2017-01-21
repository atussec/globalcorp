require 'rails_helper'

RSpec.describe "job_boards/edit", type: :view do
  before(:each) do
    @job_board = assign(:job_board, JobBoard.create!(
      :level => 1
    ))
  end

  it "renders the edit job_board form" do
    render

    assert_select "form[action=?][method=?]", job_board_path(@job_board), "post" do

      assert_select "input#job_board_level[name=?]", "job_board[level]"
    end
  end
end
