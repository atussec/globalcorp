class JobBoard < ApplicationRecord
  has_many :jobs

  scope :skill, -> (skill) {where(arel_table[:skill].lteq(skill))}

  def self.get_random(skill, counter = 0)
    board = offset(rand(count)).first
    if board.skill > skill
      return counter > 10 ? nil : get_random(skill, counter+1)
    end
    return board
  end

  def self.init_new_board(skill, level = 0)
    board = self.create({skill: skill, level: level})
    board.save
    board.generate_new_job
    board
  end

  def generate_new_job
    # stub for randomly generating new jobs
    random = Random.new
    level = self.level
    skill = self.skill
    min_money = [Math.log2(skill), 0].max
    money_per_minute = random.rand(min_money..skill)
    time = random.rand(1..level*60 + skill*60 + 1)
    money = (money_per_minute*time)/(60)
    job = self.jobs.create({money: money, time: time, skill: skill})
    JobChannel.add(job, self.id)
  end

  def generate_jobs
    # always generate one new job
    generate_new_job

    # check if you need to generate more
    if self.jobs.count < 4
      generate_new_job
    end
    # for now not
  end
end
