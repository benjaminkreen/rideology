json.(@user, :id, :fname, :lname)

json.ride_offers do
  json.array!(@user.ride_offers.includes(:passengers)) do |ride_offer|
    json.(ride_offer, :id, :origin, :destination)
    json.passengers do
     json.array!(ride_offer.passengers) do |passenger|
       json.(passenger, :fname, :lname, :email)
     end
   end
 end
end

json.takes do
  json.array!(@user.takes.includes(:user)) do |take|
    json.(take, :origin, :destination, :cost, :id)
    json.(take.user, :fname, :lname, :email)
  end
end