require 'digest/bubblebabble'

class Job < ApplicationRecord
  belongs_to :job_board

  def hash_num
    digest = Digest::SHA256.hexdigest attributes.as_json.to_s
    num = digest.to_i(16)
    num % (16 * 31)
  end
end
