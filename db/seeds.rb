# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_list = [
  [ "amitsinhaee2013@gmail.com", 123456789, 123456789, "ADMIN" ],
]

user_list.each do |user|
  User.create( :email=>user[0], :password=>user[1], :password_confirmation =>user[2], :role=>user[3] )
end
