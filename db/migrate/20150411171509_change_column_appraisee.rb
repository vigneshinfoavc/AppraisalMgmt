class ChangeColumnAppraisee < ActiveRecord::Migration
  def change
    rename_column :appraisees, :month_year, :month
    add_column :appraisees, :year, :string
  end
end
