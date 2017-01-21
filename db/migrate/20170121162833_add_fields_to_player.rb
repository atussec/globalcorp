class AddFieldsToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :money, :decimal, precision: 999, scale: 2, default: 1
    add_column :players, :tutorial, :integer, default: 0
  end
end
