class Player < ApplicationRecord
  validates :name, length: { in: 3..20 }, uniqueness: true

  has_one :work

  # Validates that the player fulfills all requirements to start the job
  #
  # He needs to have room in his workload
  #
  # Job is currently unused but will be needed later
  def can_start(job)
    if self.work.present?
      return false
    end
    # maybe check other requirements later?
    true
  end

  # Start working on a job
  #
  # The job has to be deleted from it's board
  # The board has to be pinged to create new jobs eventually
  def start(job)
    # save the board to later ping it
    board = job.job_board

    # save important job variables needed for work
    money = job.money
    time = job.time
    skill = job.skill

    # remove the job now to tighten the chance for race conditions
    job.destroy

    # This will ping the board to generate new jobs
    # Later skip this for companies
    board.generate_jobs
  end
end
