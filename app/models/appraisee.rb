class Appraisee < ActiveRecord::Base
  belongs_to :user
  validates :trainings, :presence => true, :length => { :minimum => 5 }
  validates :projects, :presence => true,:length => { :minimum => 5 }
  validates :appreciations, :presence => true,:length => { :minimum => 5 }
  validates :remarks, :presence => true,:length => { :minimum => 5 }
  validates :month, uniqueness: { scope: :year, message: "should happen once per year" }
  
  scope :sort, lambda { order("month ASC, year ASC") }
  
  def self.by_employee(emp_id, role)
    if role == "Employee"
      where(:user_id => emp_id)
    elsif role == "Manager"
      users = User.where(:manager_id => emp_id).pluck(:id)
      where( "user_id in(?)", users )
    end
  end
end
