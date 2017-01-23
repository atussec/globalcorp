class AddSkillToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :skill, :decimal, precision: 10, scale: 2, default: "0.0"
    add_column :players, :admin, :boolean, null: false, default: false
  end
end
