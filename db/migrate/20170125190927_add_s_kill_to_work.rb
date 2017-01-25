class AddSKillToWork < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :skill, :integer, default: 0
  end
end
