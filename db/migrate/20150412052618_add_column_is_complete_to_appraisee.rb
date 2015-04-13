class AddColumnIsCompleteToAppraisee < ActiveRecord::Migration
  def change
    add_column :appraisees, :is_complete, :boolean, :default => false
  end
end
