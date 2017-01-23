class JobBoardsController < ApplicationController
  before_action :set_job_board, only: [:show]
  before_action :ensure_player

  # GET /job_boards
  # GET /job_boards.json
  def index
    @board = JobBoard.get_random
    redirect_to @board
  end

  # GET /job_boards/1
  # GET /job_boards/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_board
      @job_board = JobBoard.find(params[:id])
    end
end
