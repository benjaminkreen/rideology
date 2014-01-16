class RideOffer < ActiveRecord::Base
  attr_accessible :date, :user_id, :origin, :destination, :spots, :cost
  
  has_one(
    :driver,
    :primary_key => :id,
    :foreign_key => :user_id,
    :class_name => "user"
  )
  
  has_many :ride_takes
  
  has_many(
    :passengers,
    :through => :ride_takes,
    :source => :user
  )
end
