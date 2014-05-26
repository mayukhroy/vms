# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_list = [
  [ "Amit Sinha", "amitsinhaee2013@gmail.com", "7308426816", 123456789, 123456789, "ADMIN" ],
]

user_list.each do |user|
  User.create( :name=>user[0], :email=>user[1], :contact_number=>user[2], :password=>user[3], :password_confirmation =>user[4], :role=>user[5] )
end
