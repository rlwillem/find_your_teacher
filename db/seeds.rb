# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding database"
Appointment.destroy_all
Teacher.destroy_all
Subject.destroy_all

languages_array = %w[dutch english french japanese chinese spanish]
appointment_status = %w[pending accepted declined]
puts "creating subjects"

languages_array.each do |language|
  subject = Subject.new(name: language)
  subject.save
end
puts "creating Teachers"
30.times do
  teacher = Teacher.new(name: Faker::RickAndMorty.character, description: Faker::RickAndMorty.quote)
  teacher.subject = Subject.all.sample
  teacher.user = User.last
  teacher.save
end
puts "creating appointments for user.first"
5.times do
  appointment = Appointment.new(status: appointment_status.sample, date: DateTime.now.strftime("%A, %d %b %Y %l:%M %p"))
  appointment.teacher = Teacher.all.sample
  appointment.user = User.first
  appointment.save
end
