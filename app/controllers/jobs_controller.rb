class JobsController < ApplicationController
  before_action :set_job, only: [:show, :start]
  before_action :ensure_player

  # GET /jobs
  # GET /jobs.json
  def index
    # we don't want anyone to see all jobs
    redirect_to job_boards_path
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    # Display the job in it's board
    redirect_to @job.job_board
  end

  # A player clicked start on a job
  # The job will be removed from the board (#destroy)
  # And a PlayerJob will be inserted for the player.
  #
  # There need to be some safety checks to ensure that the player has enough money etc.
  # Also broadcast this change to the ActionCable channel
  #
  # Also ping the board to generate a new job if the are some missing
  def start
    @board = @job.job_board
    unless @player.can_start @job
      # Something was not quite right...
      # Maybe later redirect to the job overview if one exists
      redirect_to @job.job_board
    end



    # todo: fill out
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end
end
