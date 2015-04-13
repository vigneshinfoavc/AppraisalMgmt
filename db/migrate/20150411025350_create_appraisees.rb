class CreateAppraisees < ActiveRecord::Migration
  def change
    create_table :appraisees do |t|
      t.text :trainings
      t.text :projects
      t.text :appreciations
      t.text :remarks
      t.text :feedback
      t.integer :user_id
      t.string :month_year
      t.timestamps
    end
  end
end
