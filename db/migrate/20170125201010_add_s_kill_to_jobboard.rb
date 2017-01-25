class AddSKillToJobboard < ActiveRecord::Migration[5.0]
  def change
    add_column :job_boards, :skill, :integer, default: 0
  end
end
