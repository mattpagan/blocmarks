require 'faker'

# Create Users

10.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10),
  )
  user.skip_confirmation!
  user.save!
  user.update_attribute(:role, 'member')
end
users= User.all

15.times do
  topic = Topic.create!(
    user:  users.sample,
    title: "##{Faker::Lorem.word}"
  )
  topic.save!
end
topics = Topic.all

admin = User.new(
  name: 'Matt Pagan',
  email: 'matthew.pagan@me.com',
  password: 'helloworld',
  password_confirmation: 'helloworld'
)
admin.skip_confirmation!
admin.save!
admin.update_attribute(:role, 'admin')

puts "Seeding Finished"
puts "#{User.count} users created."
puts "#{Topic.count} topics created."