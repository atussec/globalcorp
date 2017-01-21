class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.decimal :money
      t.integer :time
      t.references :job_board, foreign_key: true

      t.timestamps
    end
  end
end
