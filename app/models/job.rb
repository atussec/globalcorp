require 'digest/bubblebabble'

class Job < ApplicationRecord
  belongs_to :job_board

  def hash_num
    digest = Digest::SHA256.hexdigest attributes.as_json.to_s
    num = digest.to_i(16)
    # current number of classes is 1408
    num % (1408)
  end
end
