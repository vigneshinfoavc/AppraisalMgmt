class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end
    add_column :users, :role_id, :integer
    load_data
  end
  
  def load_data
    Role.create(:name => "Admin")
    Role.create(:name => "Manager")
    Role.create(:name => "Employee")
  end
end
