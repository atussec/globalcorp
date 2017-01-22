class JobBoard < ApplicationRecord
  has_many :jobs

  def self.get_random
    offset(rand(count)).first or init_new_board
  end

  def self.init_new_board(level = 0)
    board = self.new({level: level})
    board.save

    board
  end
end
