class AddSkillToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :skill, :integer, default: 0
  end
end
