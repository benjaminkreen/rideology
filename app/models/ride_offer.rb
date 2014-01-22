class RideOffer < ActiveRecord::Base
  attr_accessible :date, :user_id, :origin, :destination, :spots, :cost
  
  belongs_to :user
  
  has_many :ride_takes, dependent: :destroy
  
  has_many(
    :passengers,
    :through => :ride_takes,
    :source => :user
  )
end
