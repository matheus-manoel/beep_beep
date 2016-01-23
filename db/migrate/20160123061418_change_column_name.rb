class ChangeColumnName < ActiveRecord::Migration
  def change
   rename_column :users, :avtivated, :activated
  end
end