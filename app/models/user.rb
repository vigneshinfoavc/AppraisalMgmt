class User < ActiveRecord::Base
  has_many :appraisees
  has_secure_password
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  
  validates :first_name, :presence => true, :length => { :maximum => 25 }
  validates :last_name, :presence => true,:length => { :maximum => 50 }
  validates :username, :length => { :within => 8..25 }, :uniqueness => true
  validates :email, :presence => true, :length => { :maximum => 100 }, :format => EMAIL_REGEX, :confirmation => true
  validates :password, :presence => true, :on => :create
  validates :password_confirmation, :presence => true, :on => :create
  #validates :password, :presence => true, :length => { :maximum => 25 }, :on => :create
  #validates :password_confirmation, :presence => true, :on => :create
  
  scope :sort, lambda { order("last_name ASC, first_name ASC") }
  #scope :mlist, -> { where(:role=>'Manager') }
  
  def name
    "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end
  
  def self.manager_list
    User.select(:id,:first_name).where(:role=>'Manager').order(:first_name)
  end
end
