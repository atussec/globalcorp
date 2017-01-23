class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.decimal :money, precision: 999, scale: 2
      t.integer :time
      t.references :player, foreign_key: true
      t.datetime :finished_at

      t.timestamps
    end
  end
end
