class CreateJobBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :job_boards do |t|
      t.integer :level

      t.timestamps
    end
  end
end
