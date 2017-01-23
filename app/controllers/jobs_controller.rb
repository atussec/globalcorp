class JobsController < ApplicationController
  before_action :set_job, only: [:show]

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
  def start

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end
end
