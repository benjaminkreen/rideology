class RideTake < ActiveRecord::Base
  attr_accessible :user_id, :ride_offer_id
  
  belongs_to :user
  belongs_to :ride_offer
  
end
