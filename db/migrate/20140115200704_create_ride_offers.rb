class CreateRideOffers < ActiveRecord::Migration
  def change
    create_table :ride_offers do |t|
      t.integer :user_id
      t.datetime :date
      t.string :origin
      t.string :destination
      t.integer :spots
      t.integer :cost
      
      t.timestamps
    end
  end
end
