class UpdateMoneyFromJob < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :money, :decimal, precision: 999, scale: 2, default: 0
  end
end
