# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.create(:first_name => "sumanth", :last_name => "krishna",:username => "skrishna",:email => "demo@gmail.com",:password => "admin",:password_confirmation => "admin",:role => "Admin")
manager = User.create(:first_name => "Anil", :last_name => "anilch",:username => "anilch",:email => "demo1@gmail.com",:password => "demo",:password_confirmation => "demo",:role => "Manager")
employee1 = User.create(:first_name => "vignesh", :last_name => "thangarasu",:username => "vignesht",:email => "demo2@gmail.com",:password => "demo",:password_confirmation => "demo",:role => "Employee",:manager_id => manager.id)
employee2 = User.create(:first_name => "prasath", :last_name => "guduru",:username => "gprasad",:email => "demo3@gmail.com",:password => "demo",:password_confirmation => "demo",:role => "Employee",:manager_id => manager.id)
