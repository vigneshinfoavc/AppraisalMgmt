class RenameColumnToUser < ActiveRecord::Migration
  def change
    change_column :users, :role_id, :string
    rename_column :users, :role_id, :role
  end
end
