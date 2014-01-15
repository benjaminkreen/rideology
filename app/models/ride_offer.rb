class RideOffer < ActiveRecord::Base
  attr_accessible :title, :body
  
  has_one(
    :driver,
    :primary_key => :id,
    :foreign_key => :user_id,
    :class_name => "user"
  )
end
