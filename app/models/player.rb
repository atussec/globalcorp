class Player < ApplicationRecord
  validates :name, length: { in: 3..20 }, uniqueness: true

  has_one :work

  # Validates that the player fulfills all requirements to start the job
  #
  # He needs to have room in his workload
  def can_start(job: Job)
    if self.work.present?
      return false
    end
    # maybe check other requirements later?
    true
  end
end
