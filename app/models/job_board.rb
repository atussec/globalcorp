class JobBoard < ApplicationRecord
  has_many :jobs

  def self.get_random
    offset(rand(count)).first or init_new_board
  end

  def self.init_new_board(level = 0)
    board = self.new({level: level})
    board.save
    board.generate_new_job
    board
  end

  def generate_new_job
    # stub for randomly generating new jobs
    random = Random.new
    level = self.level + 1.0
    money = random.rand(0.01..level)
    time = random.rand(1..level*60)
    job = self.jobs.create({money: money, time: time})
    JobChannel.add(job, self.id)
  end

  def generate_jobs
    # always generate one new job
    generate_new_job

    # check if you need to generate more
    # for now not
  end
end
