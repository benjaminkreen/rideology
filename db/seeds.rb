# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  User.create!({
    :username => "test",
    :fname => "John",
    :lname => "Doe",
    :password => "password"
  })
  10.times do
    User.create!({
      :username => Faker::Internet.user_name,
      :fname => Faker::Name.first_name,
      :lname => Faker::Name.last_name,
      :password => "password"
    })
  end
  40.times do
    RideOffer.create!({
      :user_id => (2 + rand(9)),
      :date => DateTime.new(2014, (1 + rand(12)), (1 + rand(20))),
      :origin => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
      :destination => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
      :spots => (1 + rand(5)),
      :cost => rand(40)
    })
  end
  
  ro1 = RideOffer.new({
    :user_id => 1,
    :date => DateTime.new(2014, 2, 10),
    :origin => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
    :destination => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
    :spots => 3,
    :cost => 10
  })
  
  ro2 = RideOffer.new({
    :user_id => 1,
    :date => DateTime.new(2014, 2, 10),
    :origin => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
    :destination => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
    :spots => 3,
    :cost => 10
  })
  
  ro3 = RideOffer.new({
    :user_id => 1,
    :date => DateTime.new(2014, 2, 10),
    :origin => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
    :destination => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
    :spots => 3,
    :cost => 10
  })
  
  ro1.save!
  ro2.save!
  ro3.save!
  
  RideTake.create!({
    :user_id => 3,
    :ride_offer_id => ro1.id
  })
  
  RideTake.create!({
    :user_id => 4,
    :ride_offer_id => ro1.id
  })
  
  RideTake.create!({
    :user_id => 5,
    :ride_offer_id => ro1.id
  })
end