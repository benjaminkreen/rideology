json.(@user, :id, :fname, :lname)

json.ride_offers do
  json.array!(@user.ride_offers) do |ride_offer|
    json.(ride_offer, :id, :origin, :destination)
    json.passengers do
     json.array!(ride_offer.passengers) do |passenger|
       json.(passenger, :fname, :lname)
     end
   end
 end
end