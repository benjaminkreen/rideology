# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  10.times do
    User.create!({
      :username => Faker::Internet.user_name,
      :fname => Faker::Name.first_name,
      :lname => Faker::Name.last_name,
      :password => "password"
    })
  end
  i = 1
  5.times do
    RideOffer.create!({
      :user_id => i,
      :date => DateTime.new(2014, 2, (10 + i)),
      :origin => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
      :destination => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
      :spots => (6 - i),
      :cost => i * 7.5
    })
    i += 1
  end
end