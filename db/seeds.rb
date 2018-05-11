# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
name_arr = %w( Bob Frank Alina Banana )
ActiveRecord::Base.transaction do
  name_arr.each do |name|
    email = name+"@qq.com"
    password = name*2
    User.create!(username: name, email: email, password: password, password_confirmation: password)
  end
  user = User.first
  100.times do |i|
    user.chatrooms.create!(name: "Chatroom #{i}")
  end
end